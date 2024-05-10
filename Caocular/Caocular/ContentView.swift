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
    @State var porteSelecionado: Porte = .pequeno
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20.0) {
            
            // Título
            Text("Qual a idade do seu cão?")
                .font(.header5)
                .foregroundStyle(.purple)
            
            // Anos + textfield
            VStack (alignment: .leading, spacing: 8.0) {
                Text("Anos")
                    .font(.body1)
                    .foregroundStyle(.purple)
                TextField(
                    "Quantos anos completos seu cão tem",
                    value: $years,
                    format: .number
                )
            }
            
            // Meses + textfield
            VStack (alignment: .leading, spacing: 8.0) {
                Text("Meses")
                    .font(.body1)
                    .foregroundStyle(.purple)
                TextField(
                    "Quantos meses além disso ele tem",
                    value: $months,
                    format: .number
                )
            }
            
            // Porte + segmented control
            VStack (alignment: .leading, spacing: 20.0) {
                Text("Porte")
                    .font(.body1)
                    .foregroundStyle(.purple)
                Picker ("Porte", selection: $porteSelecionado) {
                    ForEach(Porte.allCases, id: \.self) { porte in
                        Text(porte.rawValue.capitalized)
                            .tag(porte)
                    }
                } .pickerStyle(.segmented)
            }
            
            Spacer()
            
            // Resultado
            if let result {
                Text("Seu cachorro tem, em idade humana...")
                    .font(.body1)
                    .foregroundStyle(.purple)
                Text("\(result) anos")
                    .foregroundStyle(.purple)
                    .font(.display)
            } else {
                Image(ImageResource.clarinha)
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 150)
                    .frame(maxWidth: .infinity)
            }
            
            Spacer()
            
            // Botão
            Button(action: processYears, label: {
                ZStack {
                    Color.purple
                    Text("Cãocular")
                        .foregroundStyle(.white)
                        .font(.body1)
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
    
    // Cálculo
    func processYears() {
        guard let years, let months else {
            print("Preencha o campo de entrada")
            return
        }
        guard years > 0 || months > 0 else {
            print("Algum campo tem que ter valor maior que zero")
            return
        }
        result = porteSelecionado.conversaoDeIdade(
            anos: years,
            meses: months
        )
    }
}

#Preview {
    ContentView()
}
