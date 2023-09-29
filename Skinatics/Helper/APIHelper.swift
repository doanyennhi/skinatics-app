//
//  APIHelper.swift
//  Skinatics
//
//  Created by Nhii on 22/9/2023.
//

import Foundation

func setRequestHeader(link: String) -> URLRequest? {
    let url = URL(string: link)!
    
    guard let apiKey = PlistHandler.getValue(filename: "Info", key: "API_HOST") as? String else {
        return nil
    }
    guard let apiHost = PlistHandler.getValue(filename: "Info", key: "API_HOST") as? String else {
        return nil
    }
    
    var request = URLRequest(url: url)
    // set request header
    request.setValue(apiKey, forHTTPHeaderField: "X-RapidAPI-Key")
    request.setValue(apiHost, forHTTPHeaderField: "X-RapidAPI-Host")
    return request
}
