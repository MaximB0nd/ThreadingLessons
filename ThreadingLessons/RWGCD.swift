//
//  RWGCD.swift
//  ThreadingLessons
//
//  Created by Максим Бондарев on 22.05.2025.
//

import Foundation

func RWGCD () {
    let queue = DispatchQueue(label: "RWGCD")
    let group = DispatchGroup()
    
    var a = 0
    
    for i in 0..<5000 {
        queue.async(group: group) {
            for i in 0...50 {
                print(a)
            }
        }
    }
    
    for i in 0...50 {
        queue.async(group: group, flags: .barrier) {
            a += 1
        }
    }
    
    group.notify(queue: .global()){
        print(a)
    }
    
}
