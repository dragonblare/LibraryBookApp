//
//  MainScreen.swift
//  LibraryBookApp
//
//  Created by 城龍太朗 on 2023/03/22.
//

import SwiftUI

struct MainScreen: View {
    var body: some View {
        VStack{
            TabHostScreen()
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    
                }) {
                    Image(systemName: "person.fill")
                }
            }
        }
    }
}

enum TabItems {
    case library,search,howmany
}

struct TabHostScreen: View {
    @State var selected:TabItems = .library
    
    var body: some View {
        TabView (selection: $selected) {
            NavigationView{
                MyLibraryScreen()
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarTitle("screen_mylibrary".localized())
            }.navigationViewStyle(.stack)
                .tabItem {
                    let isSelected = selected == TabItems.library
                    let image = isSelected ? "books.vertical.fill" : "books.vertical"
                    Label("screen_mylibrary".localized(), systemImage: image)
                }
                .tag(TabItems.library)
            NavigationView{
                SearchScreen()
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarTitle("screen_search".localized())
            }.navigationViewStyle(.stack)
                .tabItem {
                    let isSelected = selected == TabItems.search
                    let image = isSelected ? "plus.square" : "plus.square.fill"
                    Text("screen_search".localized())
                        .foregroundColor(.black)
                    Label("screen_mylibrary".localized(), systemImage: image)
                }
                .tag(TabItems.search)
            
            NavigationView{
                HowmanyScreen()
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarTitle("screen_howmany".localized())
            }.navigationViewStyle(.stack)
                .tabItem {
                    let isSelected = selected == TabItems.howmany
                    let image = isSelected ? "trophy" : "trophy.fill"
                    Label("screen_howmany".localized(), systemImage: image)
                }
                .tag(TabItems.howmany)
        }
        .accentColor(.black)
        .onAppear(perform: {UIApplication.shared.applicationIconBadgeNumber = 0})
    }
}

