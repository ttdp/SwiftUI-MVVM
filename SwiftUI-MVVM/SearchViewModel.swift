//
//  SearchViewModel.swift
//  SwiftUI-MVVM
//
//  Created by Tian Tong on 7/26/20.
//  Copyright © 2020 TTDP. All rights reserved.
//

import Foundation
import Combine

class SearchViewModel: ObservableObject {
    
    @Published private var users: [User] = [User(name: "Leanne Graham"), User(name: "Matt Tian"), User(name: "Ervin Howell"), User(name: "Clementine Bauch"), User(name: "Chelsey Dietrich"),
        User(name: "Kurtis Weissnat"), User(name: "Glenna Reichert"), User(name: "Clementina DuBuque")]
    
    /* Go Rest API Token
     SmT9aBvZYtCz3yxZlJlJPTS7rfNdD155Erwu
     */
    
    //https://gorest.co.in/public-api/users?first_name=tian&_format=json&access-token=SmT9aBvZYtCz3yxZlJlJPTS7rfNdD155Erwu
    
    @Published var text = ""
    
    @Published private(set) var players = [User(name: "Tong Tian"), User(name: "Matt Tian"), User(name: "Molly Tian"), User(name: "Yan Shao"), User(name: "Yue Ming Shao")]
    
    private var cancellable: AnyCancellable?
    
    init() {
        cancellable = $text.sink { value in
            self.players = value.isEmpty ? self.users : self.users.filter { $0.firstName.lowercased().contains(value.lowercased()) }
        }
    }
    
    func fetchUsers() {
        let url = URL(string: "https://gorest.co.in/public-api/users?_format=json&access-token=SmT9aBvZYtCz3yxZlJlJPTS7rfNdD155Erwu&first_name=tian")!
        
        URLSession.shared.dataTask(with: url) {  data, response, error in
            guard let data = data else { return }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            let json = try? decoder.decode(GoRestJSON.self, from: data)
            
            guard let users = json?.result else { return }
            
            DispatchQueue.main.async {
                self.users = users
                print(users)
            }
        }
        .resume()
    }

}
