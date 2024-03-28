//
//  SignUpView.swift
//  ClothingApp
//
//  Created by NIBM-LAB04-PC04 on 2024-03-28.
//

import SwiftUI

struct SignUpView: View {
    @State private var name: String = ""
    @State private var email: String = ""   
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var isSignUpSuccessful = false // State to track sign-up success

    var body: some View {
        VStack {
            // Title
            Text("Sign Up")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 20) // Add bottom padding
            
            // Sign-up form
            TextField("Name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            TextField("Email", text:$email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                                
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .autocapitalization(.none) // Disable autocapitalization
            SecureField("Confirm Password", text: $confirmPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .autocapitalization(.none) // Disable autocapitalization
            
            Button(action: {
                // Validate sign-up
                if isValidSignUp(name: name, email: email, password: password, confirmPassword: confirmPassword) {
                    isSignUpSuccessful = true
                }
            }) {
                Text("Sign Up")
                    .padding(10)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            
            if isSignUpSuccessful {
                Text("Sign up successful!")
                    .foregroundColor(.green)
                    .padding(.top, 10) // Add top padding
            }
        }
        .padding()
    }

    func isValidSignUp(name: String,email:String, password: String, confirmPassword: String) -> Bool {
        return !name.isEmpty && !email.isEmpty && password == confirmPassword && password.count >= 6
    }
}
