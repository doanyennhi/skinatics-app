//
//  handleInfoPlist.swift
//  Skinatics
//
//  Created by Nhii on 19/9/2023.
//

import Foundation

struct InfoPlistHandler {
    static private func getInfoDict() -> [String: Any]? {
        guard let infoDict = Bundle.main.infoDictionary else {
            return nil
        }
        return infoDict
    }
    
    static func getValue(key: String) -> AnyObject? {
        guard let value = getInfoDict()?[key] as? AnyObject else {
            return nil
        }
        return value
    }
}
