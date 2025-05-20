//
//  RunLoop.swift
//  ThreadingLessons
//
//  Created by Максим Бондарев on 20.05.2025.
//

import Foundation

func runThread () {
    Thread.detachNewThread {
        let port = Port()
        RunLoop.current.add(port, forMode: .default)
        let timer = Timer(timeInterval: 1, repeats: true) { _ in
            print(Date.now)
        }
        RunLoop.current.add(timer, forMode: .default)
        RunLoop.current.run(until: .now + 10)
    }
    
    
}
