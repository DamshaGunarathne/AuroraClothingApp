//
//  LoginView.swift
//  ClothingApp
//
//  Created by NIBM-LAB04-PC04 on 2024-03-23.
//

import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showAlert: Bool = false


    var body: some View {
        ZStack{
            Color.blue
                .ignoresSafeArea()
            Circle().scale(1.7)
                .foregroundColor(.white.opacity(0.15))
            Circle().scale(1.5)
                .foregroundColor(.white)
            VStack{
                Spacer()
                
                VStack(spacing:16){
                    Text("AuroraAttire")
                        .font(.largeTitle)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.blue)
                    
                    TextField("Username", text: $username)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    SecureField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                .padding()
                
                Button(action: {
                    // Handle login button tap event
                    self.loginButtonTapped()
                }) {
                    Text("Login")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(5)
                }
                .padding()
                
                Spacer()
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Alert"), message: Text("Invalid username or password"), dismissButton: .default(Text("OK")))
            }
            .padding()
        }
     
        
    }
    
    private func loginButtonTapped() {
        // Perform login validation
        if isValidCredentials() {
            // Login successful, do something
            print("Login successful")
        } else {
            // Show alert for invalid credentials
            showAlert = true
        }
    }
    
    private func isValidCredentials() -> Bool {
        // Check if username and password match some predefined values (demo purpose)
        return username == "demo" && password == "password"
    }
}

    struct LoginView_Previews: PreviewProvider {
            static var previews: some View {
                LoginView()
            }
        }


