//
//  GCDasync.swift
//  ThreadingLessons
//
//  Created by Максим Бондарев on 22.05.2025.
//

import Foundation

func GCDasync() {
    let group = DispatchGroup()
    let queue = DispatchQueue.global(qos: .userInteractive)
    var a = 0
    var b = 0
    queue.async(group: group) {
        a = bigInt()
    }
    queue.async(group: group) {
        b = bigInt()
    }
    group.notify(queue: .global(qos: .userInteractive)) {
        print(a + b)
    }
    
}

func bigInt() -> Int {
    var a = 0
    for _ in 0..<1_000_000 {
        a += 1
    }
    return a
}
