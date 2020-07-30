//
//  ViewModel.swift
//  SwiftUI-MVVM
//
//  Created by Tian Tong on 7/26/20.
//  Copyright © 2020 TTDP. All rights reserved.
//

import Foundation

class PlayerListViewModel: ObservableObject {
    
    @Published var players: [Player] = []
    
    func fetchPlayers() {
        let url = URL(string: "https://reqres.in/api/users")!
        
        URLSession.shared.dataTask(with: url) {  data, response, error in
            guard let data = data else { return }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            let list = try? decoder.decode(ReqResList.self, from: data)
            
            guard let users = list?.data else { return }
            
            DispatchQueue.main.async {
                self.players = users
            }
        }
        .resume()
    }

}
