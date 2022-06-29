//
//  ContentView.swift
//  GymAppPro
//
//  Created by Hassane Sidibe on 4/8/22.
//

import SwiftUI
import CoreData
import Firebase



//For testing line chart
struct Testing_view: View {
    
    var body: some View {
        VStack {
                     Text("Line Chart")
         
                     ZStack {
                         Rectangle()
                             .stroke(Color.gray, lineWidth: 3.0)
                             .frame(width: 300, height: 300, alignment: .center)
        
                         LineShape(yValues: [0.8, 0.1, 0.9, 0.2, 0.4, 0.78], scaleFactor: 300)
                            .stroke(Color.red, lineWidth: 2.0)
                            .frame(width: 300, height: 300, alignment: .center)
                         
                         LineShape(yValues: [0.4, 0.4, 0.98, 0.1, 0.78], scaleFactor: 300)
                            .stroke(Color.blue, lineWidth: 2.0)
                            .frame(width: 300, height: 300, alignment: .center)
                   }
        
                    Spacer()
               }
    }
}



enum Login: String, CaseIterable {
    case sign_in = "Sign in"
    case create_account = "Create account"
}


//WORKING ON IMPLEMETING A LOGGIN SCREEN TO THE APP, USING FIREBASE

struct LoginView: View {
    @State private var login = Login.sign_in
    @State private var email = ""
    @State private var password = ""
    
    init() {
        //Do nothing if we are in preview mode
        if ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1" {
            
        } else {
            FirebaseApp.configure()
        }
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                
                VStack { }.padding()  //for styling purpose
                
                Picker("", selection: $login) {
                    ForEach(Login.allCases, id: \.self) {info in
                        Text(info.rawValue)
                    }
                }
                .pickerStyle(.segmented)
                .padding()
                
                if login == .sign_in {
                    //show the login view
                    show_login_screen
                } else {
                    show_create_account_screen
                }
                
                Button(action: {
                    //Check user credentials
                    create_account_or_login()
                    
                }) {
                    RoundedRectangle(cornerRadius: 5)
                        .frame(height: 50)
                        .overlay(
                            Text(login.rawValue).foregroundColor(.white)
                        )
                        .padding()
                }
            }
            .navigationTitle(login.rawValue)
            .background(Color.gray.opacity(0.2))
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    var button_image: some View {
        Circle().stroke(lineWidth: 3)
            .frame(width: 200, height: 200)
            .overlay(
                Image(systemName: "person.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
            )
    }
    
    var show_login_screen: some View {
        
        VStack(spacing: 15) {
            
            VStack {
                TextField("Email", text: $email)
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .textFieldStyle(.roundedBorder)
                
                SecureField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)
            }
            .padding()
        }
    }
    
    var show_create_account_screen: some View {
        VStack {
            Button(action: {
                
            }) {
                button_image
                    .foregroundColor(.primary)
            }
            
            VStack {
                TextField("Email", text: $email)
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .textFieldStyle(.roundedBorder)
                SecureField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)
            }
            .padding()
        }
    }
    
    
    private func create_account_or_login() {
        if login == .sign_in {
            print("Should login to Firebase with credentials")
            loginUser()
            
        } else {
            print("Create account ")
            createNewAccount()
        }
    }
    
    private func createNewAccount() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Failled to create user \(error)")
                return
            }
            
            print("Account successfully created")
        }
    }
    
    private func loginUser() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Enable to login to account: \(error)")
                return
            }
            
            print("Successfully logged in to account!")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
