//
//  LoginView.swift
//  WorkoutLog
//
//  Created by Chloe on 3/31/23.
//

import SwiftUI
import RealmSwift

struct LoginView: View {
    @Binding var username: String
    
    @State private var email = ""
    @State private var password = ""
    @State private var passwordShowing:Bool = false
    @State var isShow:Bool = true
    @State private var newUser = false
    
    var body: some View {
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
        
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[A-Z])(?=.*[!@#$&*])(?=.*[0-9])(?=.*[a-z]).{8,}$")
        // one uppercase letter, one special case, one number, one lowercase, at least 8 length
        
        VStack {
            Spacer()
            if newUser {
                Text("Register An Account")
                    .font(.title2)
            } else {
                Text("Log In To An Existing Account")
                    .font(.title2)
            }
            TextField("email address", text: $email)
                .padding()
                .border(.gray, width: 1)
                .autocapitalization(.none)
                .disableAutocorrection(true)
            
            if (!emailPredicate.evaluate(with: email) && !email.isEmpty) {
                Text("Invalid Email Address")
                    .font(.footnote)
                    .foregroundColor(.red)
            }
            HStack {
                if self.passwordShowing {
                    TextField("Password", text: $password)
                        .padding()
                        .border(.gray, width: 1)
                        .font(.system(size: 15, weight: .regular, design: .default))
                        .keyboardType(.default)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .frame(maxWidth: UIScreen.main.bounds.width, minHeight: 10, maxHeight: 100, alignment: .center)
                } else {
                    SecureField("Password", text:$password)
                        .padding()
                        .border(.gray, width: 1)
                        .font(.system(size: 15, weight: .regular, design: .default))
                        .keyboardType(.default)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .frame(maxWidth: UIScreen.main.bounds.width, minHeight: 10, maxHeight: 100, alignment: .center)
                }
                if !password.isEmpty {
                    Button(action: {
                        self.passwordShowing.toggle()
                    }, label: {
                        
                    })
                    .overlay(
                        Image(systemName: self.passwordShowing ? "eye" : "eye.slash")
                            .foregroundColor(.gray)
                            .padding(.trailing, 45)
                            .onTapGesture {
                                self.passwordShowing.toggle()
                            }
                        
                    )
                }
            }
            if !password.isEmpty && !passwordPredicate.evaluate(with: password) && newUser {
                Text("Invalid password. \nOne uppercase, lowercase, special character and number required.")
                    .font(.footnote)
                    .foregroundColor(.red)
            }
            Button(action: {newUser.toggle() }) {
                HStack {
                    Image(systemName: newUser ? "checkmark.square" : "square")
                    Text("Register New User")
                } .padding()
            }
            Button(action: userAction) {
                Text(newUser ? "Register" : "Log in")
                    .padding(.horizontal, 60)
                    .padding(.vertical, 20)
                    .background(.blue)
                    .foregroundColor(.white)
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                    .cornerRadius(4)
            }

            Spacer()
        }
        .padding()
    }
    
    private func userAction() {
        if newUser {
            signUp()
        } else {
            login()
        }
    }
    
    private func signUp() {
        app.emailPasswordAuth.registerUser(email: email, password: password) { error in
            if let error = error {
                print("\(error.localizedDescription)")
            } else {
                login()
            }
            
        }
    }
    private func login() {
        app.login(credentials: Credentials.emailPassword(email: email, password: password)) { result in
           // DispatchQueue.main.async {
            switch result {
                    case .failure(let error):
                        print("Login failed: \(error.localizedDescription)")
                       
                    case .success(let user):
                        username = email
                        print("Successfully logged in as user \(user)")
                    }
            //}
        }
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(username: .constant(""))
    }
}
