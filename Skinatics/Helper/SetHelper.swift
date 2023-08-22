//
//  SetHelper.swift
//  Skinatics
//
//  Created by Nhii on 18/8/2023.
//

import Foundation

/// Remove item if it is already in set, otherwise add it to set
func toggleItem<T>(set: inout Set<T>, item: T) {
    if (set.contains(item)) {
        set.remove(item)
    } else {
        set.insert(item)
    }
}
