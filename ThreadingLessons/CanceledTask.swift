//
//  CanceledTask.swift
//  ThreadingLessons
//
//  Created by Максим Бондарев on 23.05.2025.
//

import Foundation

func CanceledTask() {
    let task = Task {
        try await Task.sleep(for: .seconds(1))
        print("1")
        try Task.checkCancellation()
        
        async let a = getRandomSumm()
        
        try Task.checkCancellation()
        
        async let b = getRandomSumm()
        
        try Task.checkCancellation()
        
        async let c = getRandomSumm()
        
        print(await a + b + c)
    }
    task.cancel()
    print("2")
    
}
