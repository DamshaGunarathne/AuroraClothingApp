import SwiftUI

struct BlackBorderTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding()
            .background(RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: 1))
    }
}

struct LoginView: View {
    @Binding var isLoggedIn: Bool
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isLoginFailed = false
    @State private var isPasswordVisible = false
    @State private var isSignUpActive = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Image("user") // User avatar image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .padding(.top, 20)
                
                // Title
                Text("AuroraAttire")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.teal)
                
                // Login form
                VStack(spacing: 15) {
                    ZStack(alignment: .trailing) {
                        TextField("Email", text: $email)
                            .textFieldStyle(BlackBorderTextFieldStyle())
                            .padding()
                            .autocapitalization(.none)
                    }
                    
                    HStack {
                        // Password field
                        if isPasswordVisible {
                            TextField("Password", text: $password)
                                .textFieldStyle(BlackBorderTextFieldStyle())
                                .padding()
                        } else {
                            SecureField("Password", text: $password)
                                .textFieldStyle(BlackBorderTextFieldStyle())
                                .padding()
                                .autocapitalization(.none)
                        }
                    }
                    
                    Button(action: {
                        // Validate login
                        if isValidLogin(email: email, password: password) {
                            isLoggedIn = true // Set login state to true
                            isLoginFailed = false
                        } else {
                            isLoginFailed = true
                        }
                    }) {
                        Text("Login")
                            .padding(10)
                            .foregroundColor(.white)
                            .background(Color.black)
                            .cornerRadius(8)
                    }
                    if isLoginFailed {
                        Text("Invalid username or password")
                            .foregroundColor(.red)
                    }
                    
                    HStack {
                        Text("Do you want to create an account?")
                            .foregroundColor(.black)
                        Button(action: {
                            isSignUpActive = true // Navigate to sign-up page
                        }) {
                            Text("SignUp")
                                .foregroundColor(.blue)
                                .underline()
                        }
                    }
                    
                    Spacer()
                }
                .padding()
                .background(Color.white) // Set background to white
                .navigationTitle("Login")
                .fullScreenCover(isPresented: $isSignUpActive) {
                    SignUpView() // Present sign-up view when active
                }
            }
        }
    }
    
    func isValidLogin(email: String, password: String) -> Bool {
        return email == "user@gmail.com" && password == "password"
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(isLoggedIn: .constant(false))
    }
}
