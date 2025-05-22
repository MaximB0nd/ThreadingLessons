//
//  GCDWorkItem.swift
//  ThreadingLessons
//
//  Created by Максим Бондарев on 22.05.2025.
//

import Foundation

func GCDWorkItem () {
    var workItem: DispatchWorkItem?
    
    workItem?.cancel()
    let item = DispatchWorkItem {
        print("is working ... ")
        Thread.sleep(forTimeInterval: 2)
    }
    
    workItem = item
    DispatchQueue.global(qos: .userInitiated).async(execute: item)
    
    workItem?.notify(queue: .global(qos: .userInitiated)) {
        print("done")
    }
    
    
}
