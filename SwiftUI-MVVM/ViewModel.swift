//
//  ViewModel.swift
//  SwiftUI-MVVM
//
//  Created by Tian Tong on 7/26/20.
//  Copyright © 2020 TTDP. All rights reserved.
//

import Foundation
import Combine

class ViewModel: ObservableObject {

    private var users: [User] = []
    
    @Published private(set) var result: [User] = []
    @Published var text = ""
    
    private var cancellable: AnyCancellable?
    
    init() {
        cancellable = $text.sink { value in
            self.result = value.isEmpty ? self.users : self.users.filter { $0.name.lowercased().contains(value.lowercased()) }
        }
    }
    
    func fetchUsers() {
        users = [User(name: "Jeff Bezos", gender: true), User(name: "Bill Gates", gender: true), User(name: "Mark Zuckerberg", gender: true), User(name: "Larry Page", gender: true), User(name: "Elon Musk", gender: true), User(name: "Francoise Bettencourt", gender: false), User(name: "MacKenzie Bezos", gender: false), User(name: "Alice Walton", gender: false), User(name: "Julia Flesher", gender: false), User(name: "Tong Tian", gender: true)]
        result = users
    }

}
