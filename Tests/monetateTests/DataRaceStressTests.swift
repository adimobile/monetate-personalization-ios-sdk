import XCTest
@testable import Monetate

final class DataRaceStressTests: XCTestCase {

    private var personalization: Personalization!

    override func setUp() {
        super.setUp()
        personalization = Personalization(
            account: Account(instance: "p", domain: "localhost.org", name: "a-701b337c", shortname: "localhost"),
            user: User(monetateId: "test-monetate-id", deviceId: "test-device-id")
        )
        // Suspend the background timer so it doesn't fire spurious callMonetateAPI()
        // calls that interfere with the controlled flush() calls below.
        personalization.timer?.suspend()
    }

    override func tearDown() {
        personalization.timer?.suspend()
        personalization = nil
        super.tearDown()
    }

    // MARK: - Cart / AddToCart

    // Exercises the Cart merge path in Utility.processEvent, which mutates
    // key.cartLines on the class instance already stored in the queue,
    // while flush() encodes that same instance concurrently via dequeueEncodedEvents().
    func testConcurrentCartReportAndFlush() {
        let iterations = 200
        let expectation = expectation(description: "all iterations complete")
        expectation.expectedFulfillmentCount = iterations

        DispatchQueue.concurrentPerform(iterations: iterations) { i in
            let ctx = ContextObj()
            try? ctx.addAllCartData([
                CartLine(sku: "sku-\(i)", pid: "pid-\(i % 10)", quantity: 1, currency: "EUR", value: "\(i).99")
            ])

            if i.isMultiple(of: 2) {
                personalization.reportCartData(contextData: ctx)
            } else {
                personalization.reportAddToCartData(contextData: ctx)
            }

            if i.isMultiple(of: 5) {
                personalization.flush()
            }

            expectation.fulfill()
        }

        waitForExpectations(timeout: 10)
    }

    // MARK: - Purchase

    func testConcurrentPurchaseReportAndFlush() {
        let iterations = 200
        let expectation = expectation(description: "all iterations complete")
        expectation.expectedFulfillmentCount = iterations

        DispatchQueue.concurrentPerform(iterations: iterations) { i in
            let ctx = ContextObj()
            try? ctx.addPurchaseData(
                purchaseId: "order-\(i)",
                purchaseLineData: [
                    PurchaseLine(sku: "sku-\(i)", pid: "pid-\(i % 10)", quantity: 1, currency: "EUR", value: "\(i).00")
                ]
            )
            personalization.reportPurchaseData(contextData: ctx)

            if i.isMultiple(of: 5) {
                personalization.flush()
            }

            expectation.fulfill()
        }

        waitForExpectations(timeout: 10)
    }

    // MARK: - Mixed (closest to real-world rapid navigation)

    // Mixes all event types simultaneously — mirrors what happens when a user
    // navigates quickly between home → PDP → basket, firing multiple Monetate
    // events before any single request completes.
    func testConcurrentMixedEventsAndFlush() {
        let iterations = 300
        let expectation = expectation(description: "all iterations complete")
        expectation.expectedFulfillmentCount = iterations

        DispatchQueue.concurrentPerform(iterations: iterations) { i in
            switch i % 4 {
            case 0:
                let ctx = ContextObj()
                try? ctx.addAllCartData([
                    CartLine(sku: "sku-\(i)", pid: "pid-\(i % 10)", quantity: 1, currency: "EUR", value: "9.99")
                ])
                personalization.reportCartData(contextData: ctx)

            case 1:
                let ctx = ContextObj()
                try? ctx.addPurchaseData(
                    purchaseId: "order-\(i)",
                    purchaseLineData: [
                        PurchaseLine(sku: "sku-\(i)", pid: "pid-\(i)", quantity: 1, currency: "EUR", value: "9.99")
                    ]
                )
                personalization.reportPurchaseData(contextData: ctx)

            case 2:
                let ctx = ContextObj()
                try? ctx.addProductDetails([Product(productId: "prod-\(i % 20)", sku: "sku-\(i)")])
                personalization.reportProductDetails(contextData: ctx)

            default:
                let ctx = ContextObj()
                try? ctx.addPageDetails(
                    pageType: "pdp",
                    path: "/p/\(i)",
                    url: "https://adidas.com/p/\(i)",
                    categories: ["shoes"],
                    breadcrumbs: ["home", "shoes"]
                )
                personalization.reportPageDetails(contextData: ctx)
            }

            // Flush more aggressively to maximise encoding racing with mutation.
            if i.isMultiple(of: 3) {
                personalization.flush()
            }

            expectation.fulfill()
        }

        waitForExpectations(timeout: 15)
    }
}
