//
//  Model.swift
//  SwiftUI-MVVM
//
//  Created by Tian Tong on 7/26/20.
//  Copyright © 2020 TTDP. All rights reserved.
//

import Foundation

struct User: Identifiable {
    let id: String
    let name: String
    let gender: Bool
}

extension User {
    init(name: String, gender: Bool) {
        self.id = UUID().uuidString
        self.name = name
        self.gender = gender
    }
}
