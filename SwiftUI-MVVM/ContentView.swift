//
//  ContentView.swift
//  SwiftUI-MVVM
//
//  Created by Tian Tong on 7/26/20.
//  Copyright © 2020 TTDP. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = PlayerListViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.players) { player in
                PlayerView(player: player)
            }
            .navigationBarTitle("Game Players")
        }
        .onAppear {
            self.viewModel.fetchPlayers()
        }
    }
    
}

struct PlayerView: View {
    
    let player: Player
    @ObservedObject var imageLoader: ImageLoader
    
    init(player: Player) {
        self.player = player
        self.imageLoader = ImageLoader(url: URL(string: player.avatar)!)
    }
    
    var body: some View {
        HStack {
            Image(uiImage: imageLoader.image ?? UIImage())
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50.0, height: 50.0, alignment: .center)
                .clipShape(Circle())
            
            Text("\(player.firstName) \(player.lastName)")
        }
    }
    
}
