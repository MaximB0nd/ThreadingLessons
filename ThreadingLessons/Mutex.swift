//
//  Mutex.swift
//  ThreadingLessons
//
//  Created by Максим Бондарев on 18.05.2025.
//

import Foundation

func Mutex_1 () {
    var a = 0
    let mutex = NSLock()
    
    for i in 0..<1000 {
        Thread.detachNewThread {
            mutex.lock()
            
            a += i
            print(i)
            
            mutex.unlock()
            
        }
    }
}


func Mutex_2 () {
    var a = 0
    let mutex = NSRecursiveLock()
    
    for i in 0..<1000 {
        Thread.detachNewThread {
            mutex.lock()
            
            a += i
            print(i)
            
            mutex.unlock()
            
        }
    }
    
    print(a)
}

func Mutex_3 () {
    var a = 0
    let mutex = NSConditionLock(condition: 1)
    
    for i in 0..<1000 {
        Thread.detachNewThread {
            mutex.lock()
            
            a += 1
            
            
            mutex.unlock(withCondition: a == 999 ? 2 : 1)
        }
    }
    
    
    Thread.detachNewThread {
        print(a)
    }
}
