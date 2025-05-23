//
//  main.swift
//  ThreadingLessons
//
//  Created by Максим Бондарев on 29.04.2025.
//

import Foundation

@main
struct Application {
    static func main() throws {
        
        CanceledTask()
        
        while true {
            Thread.sleep(forTimeInterval: 1)
        }
        
        
    }
}



