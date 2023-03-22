//
//  LancherScreen.swift
//  LibraryBookApp
//
//  Created by 城龍太朗 on 2023/03/22.
//

import SwiftUI

struct LancherScreen: View {
    @State var signUpDisplay = true
    var body: some View {
        if signUpDisplay{
            MainScreen()
        }
//        else{
//            SignInScreen()
//        }
    }
}

struct LancherScreen_Previews: PreviewProvider {
    static var previews: some View {
        LancherScreen()
    }
}
