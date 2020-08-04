//
//  SearchView.swift
//  SwiftUI-MVVM
//
//  Created by Tian Tong on 7/26/20.
//  Copyright © 2020 TTDP. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject var viewModel = SearchViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.users) { user in
                UserView(user: user)
            }
            .navigationBarTitle("Go Rest")
        }
        .onAppear {
            self.viewModel.fetchUsers()
        }
    }
    
}

struct UserView: View {
    
    let user: User
    
    init(user: User) {
        self.user = user
    }
    
    var body: some View {
        HStack {
            Text("\(user.firstName) \(user.lastName)")
        }
    }
    
}
