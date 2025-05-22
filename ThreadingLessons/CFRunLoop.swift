//
//  NSRunLoop.swift
//  ThreadingLessons
//
//  Created by Максим Бондарев on 20.05.2025.
//

import Foundation

func CFRunLoopExample() {
    var runLoop: CFRunLoop?
    
    Thread.detachNewThread {
        runLoop = CFRunLoopGetCurrent()
        let timer = Timer(timeInterval: 1, repeats: true, block: {_ in})
        
        CFRunLoopAddTimer(runLoop, timer, .defaultMode)
        
        CFRunLoopPerformBlock(runLoop, CFRunLoopMode.defaultMode.rawValue, {print("Hello from detached thread!")})
        let mode = CFRunLoopMode("MaxBond" as CFString)
        CFRunLoopAddCommonMode(runLoop, mode)
        while true {
            RunLoop.current.run(mode: .common, before: .now + 5)
        }
    }
}
