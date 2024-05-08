//
//  ContentView.swift
//  Caocular
//
//  Created by Rodrigo Freitas Moreira on 07/05/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var years: Int? = nil
    @State var months: Int? = nil
    @State var result: Int?
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("Qual a idade do seu cão?")
                .font(.system(size: 24))
            
            Text("Anos")
            TextField(
                "Quantos anos completos seu cão tem",
                value: $years,
                format: .number
            )
           
            Text("Meses")
            TextField(
                "Quantos meses além disso ele tem",
                value: $months,
                format: .number
            )
            
            Text("Porte")
            //segmented control
            
            if let result {
                Text("Seu cachorro tem, em idade humana...")
                Text("\(result) anos")
            } else {
                Image(ImageResource.clarinha)
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 150)
                    .frame(maxWidth: .infinity)
            }
            
            Button(action: {
                result = 23
            }, label: {
                ZStack {
                    Color.blue
                    Text("Cãocular")
                        .foregroundStyle(.white)
                }
            })
            .cornerRadius(12)
            .frame(height: 50)
        }
        .textFieldStyle(.roundedBorder)
        .keyboardType(.numberPad)
        .bold()
        .fontDesign(.rounded)
        .padding()
    }
}

#Preview {
    ContentView()
}
