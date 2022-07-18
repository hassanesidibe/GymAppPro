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

enum MuscleNameType: String, CaseIterable {
    case scientiphic = "Scientific", regular = "Regular"
}

struct SettingsView: View {
    @EnvironmentObject var vm: ViewModel
    @State private var current_software_version = "1.0.0"
    @State private var chosenThem: AppTheme = .black
    @State private var muscleNameType = MuscleNameType.regular
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                Form {
                    Section {
                        Picker("Color", selection: $chosenThem) {
                            ForEach(AppTheme.allCases, id: \.self) {color in
                                Text(color.rawValue)
                            }
                        }
                        
                    } header: {
                        Text("App theme")
                    }
                    
                    Section {
                        Picker("", selection: $muscleNameType) {
                            ForEach(MuscleNameType.allCases, id: \.self) {muscle in
                                Text(muscle.rawValue)
                            }
                        }
                        .pickerStyle(.segmented)
                    } header: {
                        Text("Muscle name type")
                    }
                }
                
            }
            .navigationTitle("Settings")
            
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Version: \(current_software_version)")
                }
            }
        }
    }
}



struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
