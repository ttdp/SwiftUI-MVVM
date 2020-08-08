//
//  SearchViewModel.swift
//  SwiftUI-MVVM
//
//  Created by Tian Tong on 7/26/20.
//  Copyright © 2020 TTDP. All rights reserved.
//

import Foundation

class SearchViewModel: ObservableObject {
    
    @Published var users: [User] = []
    
    /* Go Rest API Token
     SmT9aBvZYtCz3yxZlJlJPTS7rfNdD155Erwu
     */
    
    //https://gorest.co.in/public-api/users?first_name=tian&_format=json&access-token=SmT9aBvZYtCz3yxZlJlJPTS7rfNdD155Erwu
    
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
            }
        }
        .resume()
    }

}
