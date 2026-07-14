//
//  RepeatingTimer.swift
//  monetate-ios-sdk
//
//  Created by Umar Sayyed on 12/10/20.
//  Copyright © 2020 Monetate. All rights reserved.
//

import Foundation

public class ScheduleTimer {
    let timeInterval: TimeInterval
    init(timeInterval: TimeInterval, callback: @escaping () -> Void) {
        self.timeInterval = timeInterval
        self.eventHandler = callback
    }
    private lazy var timer: DispatchSourceTimer = {
        let t = DispatchSource.makeTimerSource()
        t.schedule(deadline: .now() + self.timeInterval, repeating: self.timeInterval)
        t.setEventHandler(handler: { [weak self] in
            self?.eventHandler()
        })
        return t
    }()
    public var eventHandler: (() -> Void)
    private enum State {
        case suspended
        case resumed
    }
    private var state: State = .suspended
    public func resume() {
        if state == .resumed {
            return
        }
        state = .resumed
        timer.schedule(deadline: .now() + self.timeInterval, repeating: self.timeInterval)
        timer.resume()
        let timestamp = Date().toString("E dd MM yyyy HH:mm:ss")
        Log.debug("Timer resumed with duration \(self.timeInterval) seconds - \(timestamp)", shouldLogContext: false)
    }
    
    public func suspend() {
        if state == .suspended {
            return
        }
        state = .suspended
        timer.suspend()
        let timestamp = Date().toString("E dd MM yyyy HH:mm:ss")
        Log.debug("Timer suspended - \(timestamp)", shouldLogContext: false)
    }
    
    deinit {
        timer.setEventHandler {}
    
        if state == .suspended {
            timer.resume()
        }
        timer.cancel()
    }
}




