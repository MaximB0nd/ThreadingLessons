//
//  GCD.swift
//  ThreadingLessons
//
//  Created by Максим Бондарев on 22.05.2025.
//

import Foundation

func GCD () {
    let queue = DispatchQueue(label: "queue", qos: .userInteractive, attributes: .concurrent, autoreleaseFrequency: .workItem, target: .main)
    queue.sync {
        print("1")
    }
    queue.async {
        print("2")
    }
    queue.async {
        print("3")
    }
    queue.async {
        print("4")
    }
    queue.async {
        print("5")
    }
}
