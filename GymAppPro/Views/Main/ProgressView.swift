//
//  ProgressView.swift
//  GymAppPro
//
//  Created by Hassane Sidibe on 4/13/22.
//

import SwiftUI
import SwiftUICharts

struct ProgressView: View {
    
    @State private var muscle: Muscle = .back
    @State var startDate: Date = Date()
    @State var endDate: Date = Date()
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                VStack {
                    topBadge
                    .frame(width: 400, height: 90)
                    
                    Form {
                        Section(header: Text("Muscle")) {
                            Picker("", selection: $muscle) {
                                ForEach(Muscle.allCases, id: \.self) {muscle in
                                    Text(muscle.rawValue)
                                }
                            }
                            .pickerStyle(.menu)
                        }
                        
                        Section(header: Text("Dates")) {
                            DatePicker("From: ", selection: $startDate, displayedComponents: .date)
                                .pickerStyle(.wheel)
                            DatePicker("To", selection: $endDate, displayedComponents: .date)
                        }
                        
                    }
                    .frame(height: 300)
                    
                    VStack {
                        viewChartButton
                        
    //                    BarChartView(data: [150.2, 23,1, 200.6], title: "\(muscle.rawValue)")
                        
                        /*BarChartView(data: ChartData(values: [
                            ("Jan", 100), ("Feb", 200), ("Mar", 250), ("Apr", 500), ("May", 190)
                        ]),title: "\(muscle.rawValue)")*/
                        
                        BarChartView(data: ChartData(values: [
                            ("Jan", 100), ("Feb", 200), ("Mar", 250), ("Apr", 500), ("May", 190), ("June", 700), ("November", 300), ("December", 790)
                        ]), title: "Title", form: ChartForm.extraLarge)
                        
                        
                        
    //                    LineChartView(data: [150.2, 23,1, 200.6], title: "Back")
                        
    //                    LineChartView(data: [150.2, 23,1, 200.6], title: "\(muscle.rawValue)", legend: "plus", style: ChartStyle(formSize: CGSize(width: 200, height: 200)), form: nil, rateValue: nil, dropShadow: false, valueSpecifier: nil)
                    }
                    
                    Spacer()
                }
            }
            .navigationTitle("Progress")
        }
    }
    
    
    
    var topBadge: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(.indigo)
                .opacity(0.7)
            Text("Select muscle and dates to see your progress")
                .bold()
                .foregroundColor(.white)
        }
    }
    
    var viewChartButton: some View {
        Button(action: {
            
        }) {
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(.orange)
                    .frame(height: 60)
//                    .opacity(0.8)
                Text("Update Chart")
                    .bold()
                    .font(.title2)
                    .foregroundColor(.white)
            }
            .padding([.leading, .trailing, .bottom])
        }
    }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView()
            .previewInterfaceOrientation(.portrait)
    }
}
