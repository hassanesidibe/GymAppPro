//
//  ProgressView.swift
//  GymAppPro
//
//  Created by Hassane Sidibe on 4/13/22.
//

import SwiftUI
import SwiftUICharts

struct LineShape: Shape {
     var yValues: [Double]
     var scaleFactor: Double
 
     func path(in rect: CGRect) -> Path {
         let xIncrement = (rect.width / (CGFloat(yValues.count)))
         var xValue = xIncrement * 0.5
         var path = Path()
         path.move(to: CGPoint(x: xValue,
                              y: (rect.height - (yValues[0] * scaleFactor))))
        for i in 1..<yValues.count {
            xValue += xIncrement
            let pt = CGPoint(x: xValue,
                             y: (rect.height - (yValues[i] * scaleFactor)))
            path.addLine(to: pt)
        }
        return path
    }
}



struct ProgressView: View {
    @EnvironmentObject var vm: ViewModel
    @State private var muscle: Muscle = .back
    @State var startDate: Date = Date()
    @State var endDate: Date = Date()
    @State private var values_toDisplay_in_barChart: [(String, Int)]  = []
    @State private var values_toDisplay_inLine_chart: [Double] = []
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                VStack { }.padding()
                
                VStack {
//                    topBadge
//                    .frame(width: 400, height: 50)
                        BarChartView(data: ChartData(values: values_toDisplay_in_barChart), title: muscle.rawValue, form: ChartForm.extraLarge)
//                    }
                    
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
                    
                    viewChartButton
                    
                    
                    Spacer()
                }
            }
            .navigationTitle("Progress")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    
    
    var topBadge: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(.indigo)
                .opacity(0.9)
            Text("Select muscle and dates to see your progress")
                .bold()
                .foregroundColor(.white)
        }
    }
    
    var viewChartButton: some View {
        Button(action: {
            vm.progress(for: muscle, from: startDate, to: endDate)
            
            values_toDisplay_in_barChart.removeAll()
//            values_toDisplay_inLine_chart.removeAll()
            
            for index in vm.progressReport.indices {
                let exercise_sumary = vm.progressReport[index]
                let weight = Int(exercise_sumary.totalWeight)
                
                //The lines below will allow the user to choose between a line chart or bar chart view of their progress
                
                values_toDisplay_in_barChart.append((exercise_sumary.date, weight)) //This updates the barchart data
                
//                values_toDisplay_inLine_chart.append(exercise_sumary.totalWeight) //This updates the Line chart data
            }
            
        }) {
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(.green)
                    .frame(height: 60)
//                    .opacity(0.8)
                Text("Update Chart")
                    .bold()
                    .font(.title2)
                    .foregroundColor(.white)
            }
            .padding([.leading, .trailing, .bottom])
            .shadow(color: .gray.opacity(0.6), radius: 5, x: 0, y: 10)
        }
    }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView()
            .previewInterfaceOrientation(.portrait)
    }
}
