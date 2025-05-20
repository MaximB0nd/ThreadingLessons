//
//  CustomRunLoop.swift
//  ThreadingLessons
//
//  Created by Максим Бондарев on 20.05.2025.
//

import Foundation

class CustomRunLoop {
    typealias Operation = () -> Void
    private var operations: [Operation] = []
    private var lock = NSLock()
    private var condition = NSCondition()
    private var isStoped = false
    
    func runLoop () {
        if !isStoped {
            condition.wait()
            
            while let operation = getOperation() {
                operation()
            }
        }
    }
    
    func getOperation () -> Operation? {
        lock.lock()
        defer { lock.unlock() }
        
        return operations.isEmpty ? nil : operations.removeFirst()
    }
    
    
    func addOperation (_ operation: @escaping Operation) {
        lock.lock()
        defer { lock.unlock() }
        
        operations.append(operation)
        condition.signal()
    }
    
    deinit {
        print("deinit")
        isStoped = true
        condition.signal()
    }
}

class Worker {
    private let runLoop: CustomRunLoop = .init( )
    
    init (runLoop: CustomRunLoop) {
        runLoop.runLoop()
    }
    
    private func runThread () {
        Thread.detachNewThread { [weak self] in
            self?.runLoop.runLoop()
        }
    }
    
    private func getRandomSumm() -> Int {
            let limit = Int.random(in: 1000000...5000000)
            return Array(0...limit).reduce(into: 0, { $0 = $0 + $1 })
        }


    func randomSumm() {
        runLoop.addOperation { [weak self] in
            guard let self else { return }
            let a = getRandomSumm()
            print(a)
        }
    }
    
    func printThreadInfo() {
            runLoop.addOperation {
                print(Thread.current.isMainThread, Thread.current)
            }
        }
}
