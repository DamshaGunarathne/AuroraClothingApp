//
//  SignUpView.swift
//  ClothingApp
//
//  Created by NIBM-LAB04-PC04 on 2024-03-28.
//

import SwiftUI

struct SignUpBlackBorderTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding()
            .background(RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: 1))
    }
}

struct SignUpView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var isSignUpSuccessful = false // State to track sign-up success

    var body: some View {
        NavigationView {
            VStack {
                // Title
                Text("Sign Up")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 20) // Add bottom padding
                
                // Sign-up form
                TextField("Name", text: $name)
                    .textFieldStyle(SignUpBlackBorderTextFieldStyle())
                    .padding()
                TextField("Email", text:$email)
                    .textFieldStyle(SignUpBlackBorderTextFieldStyle())
                    .padding()
                                    
                SecureField("Password", text: $password)
                    .textFieldStyle(SignUpBlackBorderTextFieldStyle())
                    .padding()
                    .autocapitalization(.none) // Disable autocapitalization
                SecureField("Confirm Password", text: $confirmPassword)
                    .textFieldStyle(SignUpBlackBorderTextFieldStyle())
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
                        .background(Color.black)
                        .cornerRadius(8)
                }
                
                if isSignUpSuccessful {
                    Text("Sign up successful!")
                        .foregroundColor(.green)
                        .padding(.top, 10) // Add top padding
                }

                Spacer()

                // Back button
                NavigationLink(destination: LoginView(isLoggedIn: .constant(false))) {
                    Text("Back to Login")
                        .foregroundColor(.blue)
                }
                .padding(.bottom)
            }
            .padding()
        }
    }

    func isValidSignUp(name: String, email: String, password: String, confirmPassword: String) -> Bool {
        return !name.isEmpty && !email.isEmpty && password == confirmPassword && password.count >= 6
    }
}
