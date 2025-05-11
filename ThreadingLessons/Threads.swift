//
//  Threads.swift
//  ThreadingLessons
//
//  Created by Максим Бондарев on 07.05.2025.
//

import Foundation

func Threads() {
    
//    Thread.detachNewThread() {
//        var i = 0
//        for _ in 0..<10 {
//            i += 1
//            print("first: \(i)")
//        }
//    }
//
//    Thread.detachNewThread {
//        var i = 0
//        for _ in 0..<100 {
//            i += 1
//            print("second: \(i)")
//        }
//    }
    
    
    let thread1 = Thread {
        var i = 0
        for _ in 0..<1000 {
            //Thread.sleep(forTimeInterval: 1)
            if Thread.current.isCancelled {
                
                break
            }
            i += 1
            print("first: \(i)")
        }
    }
    
    let thread2 = Thread {
        var i = 0
        for _ in 0..<1000 {
            //Thread.sleep(forTimeInterval: 1)
            if Thread.current.isCancelled {
                break
            }
            i += 1
            print("second: \(i)")
        }
    }
    
    thread1.qualityOfService = .background
    thread2.qualityOfService = .userInitiated
//    thread1.threadPriority = 0
//    thread2.threadPriority = 1
    thread1.start()
    thread2.start()
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
        thread1.cancel()
        thread2.cancel()
    }
    
}

