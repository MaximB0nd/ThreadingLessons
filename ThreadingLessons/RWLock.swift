//
//  RWLock.swift
//  ThreadingLessons
//
//  Created by Максим Бондарев on 20.05.2025.
//

import Foundation
import QuartzCore

func RWLockExample () {
    
    var lock = pthread_rwlock_t()
    pthread_rwlock_init(&lock, nil)
    var a = [Int]()
    
    
    for _ in 0...5 {
        Thread.detachNewThread {
            let start = CACurrentMediaTime()
            for _ in 0...50000 {
                pthread_rwlock_rdlock(&lock)
                a.count
                pthread_rwlock_unlock(&lock)
            }
            print("Reading: \(CACurrentMediaTime() - start)")
        }
    }
    
    
    Thread.detachNewThread {
        let start = CACurrentMediaTime()
        for i in 0...50 {
            pthread_rwlock_wrlock(&lock)
            a.append(i)
            pthread_rwlock_unlock(&lock)
        }
        print("Writing: \(CACurrentMediaTime() - start)")
    }
}

class RWLock {

    enum Error: Swift.Error {
        case cantCreate(Int32)
        case cantReadLock(Int32)
        case cantWriteLock(Int32)
        case cantUlock(Int32)
    }

    private var lock = pthread_rwlock_t()

    public init() throws {
        let result = pthread_rwlock_init(&lock, nil)
        if result != 0 {
            throw Error.cantCreate(result)
        }
    }

    deinit {
        pthread_rwlock_destroy(&lock)
    }

    func writeLock() throws {
        let result = pthread_rwlock_wrlock(&lock)
        if result != 0 {
            throw Error.cantWriteLock(result)
        }
    }

    func readLock() throws {
        let result = pthread_rwlock_rdlock(&lock)
        if result != 0 {
            throw Error.cantReadLock(result)
        }
    }

    func unlock() throws {
        let result = pthread_rwlock_unlock(&lock)
        if result != 0 {
            throw Error.cantUlock(result)
        }
    }

}
