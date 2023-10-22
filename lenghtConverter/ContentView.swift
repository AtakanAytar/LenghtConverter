//
//  ContentView.swift
//  lenghtConverter
//
//  Created by Atakan Aytar on 28.08.2023.
//

import SwiftUI



struct ContentView: View {
    @State private var unitNumber = 0.0
    
        
    @State var toBeConvertedUnit = 0
    @State var toConvertUnit = 0
    
    var allUnits = ["mm","cm","m","km","inch","feet","yard","miles"]

    var unitsToMM = ["mm":1.0,"cm":10.0,"m":1000.0,"km":1000000.0,"inch":25.4,"feet":304.8,"yard":914.4,"miles":1609344.0]
    
    func calculateTheResult() -> Double{
        
        let firstUnitName = allUnits[toBeConvertedUnit]
        let secondUnitName = allUnits[toConvertUnit]
        
        let firstInMM = unitsToMM[firstUnitName] ?? 0.0
        let secondInMM = unitsToMM[secondUnitName] ?? 0.0
        
        let conversionCoef = firstInMM / secondInMM
        
        return conversionCoef * unitNumber
    }
        
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Number to be converted", value: $unitNumber,format: .number).keyboardType(.decimalPad)
                    
                    
                    Picker("Pick unit to be converted", selection: $toBeConvertedUnit) {
                                ForEach(allUnits.indices, id: \.self) { index in
                                    Text(self.allUnits[index]).tag(index)
                                  
                                }
                            }
                    
                   
                    
                }
                
                Section{

                    Text(String(calculateTheResult()))
                    Picker("Pick unit to be converted into", selection: $toConvertUnit) {
                                ForEach(allUnits.indices, id: \.self) { index in
                                    Text(self.allUnits[index]).tag(index)
                                }
                            }
                    
                    
                    
                   
                    
                }
                
            }.navigationTitle("Lenght Converter")
            
            
        }
        
        
        
        
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
