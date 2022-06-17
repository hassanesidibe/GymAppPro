//
//  SettingsView.swift
//  GymAppPro
//
//  Created by Hassane Sidibe on 4/13/22.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        
        NavigationView {
            VStack {
                Text("Settings")
                Text("Version 1.0.0")
            }
            
            .navigationTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
