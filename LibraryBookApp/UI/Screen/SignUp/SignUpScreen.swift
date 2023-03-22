//
//  SignUpScreen.swift
//  LibraryBookApp
//
//  Created by 城龍太朗 on 2023/03/22.
//

import SwiftUI
import Firebase

struct SignUpScreen: View {
    @State var email: String = ""
    @State var password: String = ""

    var body: some View {
        VStack {
            Text("アカウント作成")
                .font(.custom("ZenOldMincho-Regular", size: 17))
            TextField("Email", text: $email)
                .padding()
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
//                .overlay{
//                    RoundedRectangle(cornerRadius: 5)
//                        .foregroundColor(.gray)
//                }
            SecureField("Password", text: $password)
                .padding()
//                .overlay{
//                    RoundedRectangle(cornerRadius: 5)
//                        .foregroundColor(.gray)
//                }
            Button("Sign Up") {
                Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                    if let error = error {
                        // Handle error
                        print("Error creating user: \(error.localizedDescription)")
                    } else {
                        // User created successfully
                        print("User created successfully!")
                    }
                }
            }
        }
    }
}

struct SignUpScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignUpScreen()
    }
}


