//
//  SaveTypes.swift
//  ThreadingLessons
//
//  Created by Максим Бондарев on 13.05.2025.
//

import Foundation

func saveTypes () {
    var a = [Int]()
    let semaphore = DispatchSemaphore(value: 1)
    
    for i in 0..<10000 {
        Thread.detachNewThread {
            semaphore.wait()
            
            a.append(i)
            
            semaphore.signal()
            
        }
    }
    
    print(a)
    
    var b = 0
    
    for _ in 0..<10000 {
        Thread.detachNewThread {
            semaphore.wait()
            b += 1
            semaphore.signal()
        }
    }
    print(b)

    
}
