//
//  handleInfoPlist.swift
//  Skinatics
//
//  Created by Nhii on 19/9/2023.
//

import Foundation

struct PlistHandler {
    static private func getPlistDict(filename: String) -> [String: Any]? {
//        guard let infoDict = Bundle.main.infoDictionary else {
//            return nil
//        }
//        return infoDict
        if let path = Bundle.main.url(forResource: filename, withExtension: "plist") {
            do {
                let plistData = try Data(contentsOf: path)
                if let plistDict = try PropertyListSerialization.propertyList(from: plistData, options: [], format: nil) as? [String: Any] {
                    return plistDict
                }
            } catch {
                print(error)
            }
        }
        return nil
    }
    
    static func getValue(filename: String, key: String) -> AnyObject? {
        guard let value = getPlistDict(filename: filename)?[key] as? AnyObject else {
            return nil
        }
        return value
    }
}
