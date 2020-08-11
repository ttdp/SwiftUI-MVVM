//
//  UserListView.swift
//  SwiftUI-MVVM
//
//  Created by Tian Tong on 7/26/20.
//  Copyright © 2020 TTDP. All rights reserved.
//

import SwiftUI

struct UserListView: View {
    
    @ObservedObject var viewModel = ViewModel()
    @State var isGenderOn = true
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $viewModel.text)
                
                List(viewModel.result) { user in
                    UserView(user: user, isGenderOn: self.$isGenderOn)
                }
            }
            .navigationBarTitle("Users")
            .navigationBarItems(trailing: Toggle("Gender", isOn: $isGenderOn))
            .onAppear {
                self.viewModel.fetchUsers()
            }
        }
    }
    
}

struct UserView: View {
    
    let user: User
    @Binding var isGenderOn: Bool
    
    var body: some View {
        HStack {
            Text(user.name)
            
            Spacer()
            
            if isGenderOn {
                Text(user.gender ? "🙎🏻‍♂️" : "🙎🏻‍♀️")
            }
        }
    }
    
}
