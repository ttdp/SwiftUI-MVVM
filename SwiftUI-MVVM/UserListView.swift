//
//  UserListView.swift
//  SwiftUI-MVVM
//
//  Created by Tian Tong on 7/26/20.
//  Copyright © 2020 TTDP. All rights reserved.
//

import SwiftUI

struct UserListView: View {
    
    // Property
    let greeting = "Hello Folks"
    
    // @State
    @State private var isGenderOn = true

    // ObservableObject & @ObservedObject
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $viewModel.text)
                
                List(viewModel.result) { user in
                    UserView(user: user, isGenderOn: self.$isGenderOn)
                }
            }
            .navigationBarTitle(greeting)
            .navigationBarItems(trailing: Toggle("Gender", isOn: $isGenderOn))
            .onAppear {
                self.viewModel.fetchUsers()
            }
        }
    }
    
}

struct UserView: View {
    
    // Property
    let user: User
    
    // @Binding
    @Binding var isGenderOn: Bool
    
    var body: some View {
        HStack {
            Text(user.name)
            
            Spacer()
            
            if isGenderOn {
                Text(user.gender ? "🙎🏻‍♂️" : "🙎🏻‍♀️")
            }
        }
        .onTapGesture {
            self.isGenderOn.toggle()
        }
    }
    
}
