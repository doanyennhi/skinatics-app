//
//  SetHelper.swift
//  Skinatics
//
//  Created by Nhii on 18/8/2023.
//

import Foundation

// remove if item is already in list, otherwise add it
func toggleItem<T>(list: inout Set<T>, item: T) {
    if (list.contains(item)) {
        list.remove(item)
    } else {
        list.insert(item)
    }
}
