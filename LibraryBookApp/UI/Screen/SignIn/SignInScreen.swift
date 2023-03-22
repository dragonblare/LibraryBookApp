//
//  SignInScreen.swift
//  LibraryBookApp
//
//  Created by 城龍太朗 on 2023/03/22.
//

import SwiftUI
import Firebase

struct SignInScreen: View {
    @State var email: String = ""
    @State var password: String = ""

    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .padding()
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
            SecureField("Password", text: $password)
                .padding()
            Button("Log In") {
                Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                    if let error = error {
                        // Handle error
                        print("Error logging in: \(error.localizedDescription)")
                    } else {
                        // User logged in successfully
                        print("User logged in successfully!")
                    }
                }
            }
        }
    }
}
