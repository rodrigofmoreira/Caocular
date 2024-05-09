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
    let portes = ["Pequeno", "Médio", "Grande"]
    @State var porte: String = "Pequeno"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20.0) {
            
            Text("Qual a idade do seu cão?")
                .font(.system(size: 24))
                .foregroundStyle(.purple)
            
            VStack (alignment: .leading, spacing: 8.0) {
                Text("Anos")
                    .foregroundStyle(.purple)
                TextField(
                    "Quantos anos completos seu cão tem",
                    value: $years,
                    format: .number
                )
            }
            
            VStack (alignment: .leading, spacing: 8.0) {
                Text("Meses")
                    .foregroundStyle(.purple)
                TextField(
                    "Quantos meses além disso ele tem",
                    value: $months,
                    format: .number
                )
            }

            VStack (alignment: .leading, spacing: 8.0) {
                Text("Porte")
                    .foregroundStyle(.purple)
                Picker ("Porte", selection: $porte) {
                    ForEach(portes, id: \.self) { porte in
                        Text(porte)
                            .tag(porte)
                    }
                } .pickerStyle(.segmented)
            }
            
            Spacer()
            
            
            if let result {
                Text("Seu cachorro tem, em idade humana...")
                    .foregroundStyle(.purple)
                Text("\(result) anos")
                    .foregroundStyle(.purple)
                    .font(.system(size: 60))
            } else {
                Image(ImageResource.clarinha)
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 150)
                    .frame(maxWidth: .infinity)
            }
            
            Spacer()
            
            Button(action: processYears, label: {
                ZStack {
                    Color.purple
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
    
    func processYears() {
        guard let years, let months else {
            print("Preencha o campo de entrada")
            return
        }
        guard years > 0 || months > 0 else {
            print("Algum campo tem que ter valor maior que zero")
            return
        }
        result = years * 7 + months*7/12
    }
}

#Preview {
    ContentView()
}
