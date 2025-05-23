//
//  WithTaskGroup.swift
//  ThreadingLessons
//
//  Created by Максим Бондарев on 23.05.2025.
//

import Foundation

func WithTaskGroup() {
    Task {
        let result = await withTaskGroup(of: Int.self) { group in
            for _ in 0..<50 {
                group.addTask {
                    return await getRandomSumm()
                }
            }
            
            var result = [Int]()
            for await res in group {
                result.append(res)
            }
            
            return result
        }
        print(result)
    }
    
}

private func getRandomSumm() async -> Int {
    let limit = Int.random(in: 1000000...5000000)
    var arr = 0
    for i in 0..<limit {
        arr += i
        if i.isMultiple(of: 100000) {
            await Task.yield()
        }
    }
    return arr
}
