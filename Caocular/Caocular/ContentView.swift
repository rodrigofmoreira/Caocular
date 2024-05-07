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
            .textFieldStyle(.roundedBorder)
            .keyboardType(.numberPad)
            Text("Meses")
            TextField(
                "Quantos meses além disso ele tem",
                value: $months,
                format: .number
            )
            .textFieldStyle(.roundedBorder)
            .keyboardType(.numberPad)
        }
        .bold()
        .fontDesign(.rounded)
        .padding()
    }
}

#Preview {
    ContentView()
}
