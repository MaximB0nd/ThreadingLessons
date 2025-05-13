//
//  AsyncThreads_p1.swift
//  ThreadingLessons
//
//  Created by Максим Бондарев on 11.05.2025.
//

import Foundation
import QuartzCore

func getRandomSumm() -> Int {
    let limit = Int.random(in: 1000000...5000000)
    return Array(0...limit).reduce(into: 0, { $0 = $0 + $1 })
}

func asyncThreads_p1() {
    let semaphor = DispatchSemaphore(value: 0)
    //let semaphor = sem_open("app", O_CREAT, 0x666, 0)
//    guard semaphor != SEM_FAILED else {
//        fatalError("Semaphore creation failed")
//    }
    
    let start = CACurrentMediaTime()
    
    Thread.detachNewThread {
        let a = getRandomSumm()
        semaphor.signal()
        //sem_post(semaphor)
    }
    
    Thread.detachNewThread {
        let b = getRandomSumm()
        semaphor.signal()
        //sem_post(semaphor)
    }
    
    Thread.detachNewThread {
        semaphor.wait(timeout: .now() + 1)
        semaphor.wait(timeout: .now() + 1)
        
        RunLoop.main.perform {
            print("done")
        }
    }
    
    //sem_wait(semaphor)
    //sem_wait(semaphor)
    
    let duration = CACurrentMediaTime() - start
    print(duration)
}
