//
//  EventQueueManager.swift
//  monetate-ios-sdk
//
//  Created by Hasanul Benna(UST,IN) on 29/07/25.
//  Copyright © 2025 Monetate. All rights reserved.
//

import Foundation

final class EventQueueManager {
    private var queue: [ContextEnum: MEvent] = [:]
    private let serialSyncQueue = DispatchQueue(label: "com.Monetate.serialSyncQueue")

    func getQueueSnapshot() -> [ContextEnum: MEvent] {
        return serialSyncQueue.sync { queue }
    }

    func getEvent(for context: ContextEnum) -> MEvent? {
        return serialSyncQueue.sync { queue[context] }
    }

    // Add optional completion callback called once update is done
    func updateQueue(_ newQueue: [ContextEnum: MEvent], completion: (() -> Void)? = nil) {
        serialSyncQueue.async {
            if newQueue.isEmpty {
                self.queue = newQueue
            } else {
                newQueue.forEach {
                    self.queue[$0] = $1
                }
            }
            completion?()
        }
    }

    // Add optional completion callback called once event is set
    func setEvent(_ event: MEvent, for context: ContextEnum, completion: (() -> Void)? = nil) {
        serialSyncQueue.async {
            self.queue[context] = event
            completion?()
        }
    }
}
