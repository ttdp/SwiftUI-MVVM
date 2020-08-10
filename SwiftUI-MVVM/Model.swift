//
//  Model.swift
//  SwiftUI-MVVM
//
//  Created by Tian Tong on 7/26/20.
//  Copyright © 2020 TTDP. All rights reserved.
//

import Foundation

struct GoRestJSON: Decodable {
    let result: [User]
}

struct User: Decodable, Identifiable {
    let id: String
    let firstName: String
    let lastName: String
}

extension User {
    init(name: String) {
        self.id = UUID().uuidString
        self.firstName = name
        self.lastName = ""
    }
    
    var name: String {
        return "\(firstName) \(lastName)"
    }
}
