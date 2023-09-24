//
//  User.swift
//  Skinatics
//
//  Created by Nhii on 24/8/2023.
//

import Foundation
import JWTDecode

struct Profile {
  
  let id: String
  let name: String
  let email: String
    
    init() {
        self.id = ""
        self.name = ""
        self.email = ""
    }
    
    init(id: String, name: String, email: String) {
        self.id = id
        self.name = name
        self.email = email
    }
    
    static func from(_ idToken: String) -> Profile {
        guard
          let jwt = try? decode(jwt: idToken),
          let id = jwt.subject,
          let name = jwt.claim(name: "name").string,
          let email = jwt.claim(name: "email").string
        else {
          return Profile()
        }

        return Profile(
          id: id,
          name: name,
          email: email
        )
      }
}

/// Define model for user account
struct User: Identifiable {
    var id = UUID()
    private var _name: String
    private var _email: String
    private var _password: String
    private var _skinTypes: Set<String>
    private var _skinIssues: Set<String>
    private var _skinConditions: Set<String>
    
    init(name: String, email: String, password: String, skinTypes: Set<String>, skinIssues: Set<String>, skinConditions: Set<String>) {
        self._name = name
        self._email = email
        self._password = password
        self._skinTypes = skinTypes
        self._skinIssues = skinIssues
        self._skinConditions = skinConditions
    }
    
    init() {
        self.init(name: "", email: "", password: "", skinTypes: [], skinIssues: [], skinConditions: [])
    }
    
    // getters & setters
    public var name: String {
            get {
                return self._name;
            }
            set {
                self._name = newValue
            }
        }
    
    public var email: String {
            get {
                return self._email;
            }
            set {
                self._email = newValue
            }
        }
    
    public var password: String {
            get {
                return self._password;
            }
            set {
                self._password = newValue
            }
        }
    
    public var skinTypes: Set<String> {
            get {
                return self._skinTypes;
            }
            set {
                self._skinTypes = newValue
            }
        }
    
    public var skinIssues: Set<String> {
            get {
                return self._skinIssues;
            }
            set {
                self._skinIssues = newValue
            }
        }
    
    public var skinConditions: Set<String> {
            get {
                return self._skinConditions;
            }
            set {
                self._skinConditions = newValue
            }
        }
}
