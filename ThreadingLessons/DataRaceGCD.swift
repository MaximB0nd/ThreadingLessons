//
//  DataRaceGCD.swift
//  ThreadingLessons
//
//  Created by Максим Бондарев on 22.05.2025.
//

import Foundation

func dataRaceGCD () {
    let group = DispatchGroup()
    let queue = DispatchQueue(label: "com.example.concurrentQueue", qos: .userInitiated)
    let queue2 = DispatchQueue.global(qos: .userInitiated)
    
    var a = [Int]()
    
    for _ in 0...1000 {
        queue2.async(group: group) {
            let b = bigInt()
            queue.async(group: group) {
                a.append(b)
            }
        }
    }
    
    group.notify(queue: .global()){
        print(a.count)
    }
    
    
    
    
    
}
