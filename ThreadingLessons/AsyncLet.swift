//
//  AsyncLet.swift
//  ThreadingLessons
//
//  Created by Максим Бондарев on 23.05.2025.
//

import Foundation

func AsyncLet() {
    Task {
        await AsyncLet2()
    }
}

func AsyncLet2() async {
    async let result1 = getBigInt()
    async let result2 = getBigInt()
    async let result3 = getBigInt()
    
    print("1: \(await result1)")
    print("2: \(await result2)")
    print("3: \(await result3)")
    
}

func getBigInt() async -> Int {
    var a = 0
    for _ in 1...50_000_000 {
        a += 1
    }
    return a
}
