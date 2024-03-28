//
//  LoginView.swift
//  ClothingApp
//
//  Created by NIBM-LAB04-PC04 on 2024-03-28.
//

import SwiftUI

struct LoginView: View {
    @Binding var isLoggedIn: Bool // Binding to update login state
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isLoginFailed = false // State to track login failure
    @State private var isPasswordVisible = false // State to track password visibility
    @State private var isSignUpActive = false // State to track sign-up page activation

    var body: some View {
        NavigationView {
            Color(.background)
                .ignoresSafeArea()
                .overlay(
                    VStack(spacing: 20) {
                        HStack {
                            Spacer()
                            NavigationLink(destination: SignUpView(), isActive: $isSignUpActive) {
                                Text("Sign Up")
                                    .foregroundColor(.blue)
                                    .padding(.top, 5)
                                    .padding(.trailing, 20)
                            }
                        }
                        
                        Image("login")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                        
                        // Title
                        Text("AuroraAttire")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color(.title))
                        
                        Text("Login")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.teal)
                        
                        // Login form
                        TextField("Username", text: $username)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                            .autocapitalization(.none)
                        
                        HStack {
                            // Password field
                            if isPasswordVisible {
                                TextField("Password", text: $password)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .padding()
                            } else {
                                SecureField("Password", text: $password)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .padding()
                                    .autocapitalization(.none) // Disable autocapitalization
                            }
                            
                        }
                        
                        Button(action: {
                            // Validate login
                            if isValidLogin(username: username, password: password) {
                                isLoggedIn = true // Set login state to true
                                isLoginFailed = false
                            } else {
                                isLoginFailed = true
                            }
                        }) {
                            Text("Login")
                                .padding(10)
                                .foregroundColor(.white)
                                .background(Color.blue)
                                .cornerRadius(8)
                        }
                        if isLoginFailed {
                            Text("Invalid username or password")
                                .foregroundColor(.red)
                        }
                    }
                    .padding()
                )
        }
    }

    func isValidLogin(username: String, password: String) -> Bool {
        return username == "user" && password == "password"
    }
}

