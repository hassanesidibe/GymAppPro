//
//  SettingsView.swift
//  GymAppPro
//
//  Created by Hassane Sidibe on 4/13/22.
//

import SwiftUI

enum AppTheme: String, CaseIterable {
    case red = "Red", green = "Green", pink = "Pink", yellow = "Yellow", purple = "Purple", orange = "Orange", black = "Black"
}

struct SettingsView: View {
    @Environment(\.presentationMode) private var presentationMode
    @EnvironmentObject var vm: ViewModel
    @State private var current_software_version = "1.0.0"
    @State private var chosenThem: AppTheme = .black
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                Form {
                    Section {
                        NavigationLink(destination: Change_email_view().environmentObject(vm), label: { Text("Change Email")} )
                        NavigationLink(destination: Change_password_view().environmentObject(vm), label: { Text("Change password") } )
                    } header: {
                        Text("User info")
                    }

                    
                    Section {
                        NavigationLink(destination: Change_profile_image_view().environmentObject(vm), label: { Text("Change profile image") })
                        Picker("Color", selection: $chosenThem) {
                            ForEach(AppTheme.allCases, id: \.self) {color in
                                Text(color.rawValue)
                            }
                        }
                        
                    } header: {
                        Text("App theme")
                    }
                }
                
                Spacer()
                
                Button(action: {
                    //Logout of user's account, and go to the login view
                    
                    
                }) {
                    Text("Logout")
                        .foregroundColor(.red)
                }
                .padding()
                
            }
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }
            }
            
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Version: \(current_software_version)")
                }
            }
        }
    }
}


struct Change_email_view: View {
    @EnvironmentObject var vm: ViewModel
    
    var body: some View {
        Text("Hello from change email view")
    }
}

struct Change_password_view: View {
    @EnvironmentObject var vm: ViewModel
    
    var body: some View {
        Text("Hello from change password view")
    }
}

struct Change_profile_image_view: View {
    @EnvironmentObject var vm: ViewModel
    
    var body: some View {
        Text("Hello from change profile image")
    }
}



struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
