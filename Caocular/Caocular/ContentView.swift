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
    @State var failedInput = false
    let tituloPreencherCampos = "Preencha os campos para poder cãocular!"
    @State var zeroInput = false
    let tituloCamposZero = "Algum dos campos precisa ter valor maior que zero"
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20.0) {
                    
                    // Título
                    Text("Qual a idade do seu cão?")
                        .font(.header5)
                        .foregroundStyle(.indigo600)
                    
                    // Anos + textfield
                    VStack (alignment: .leading, spacing: 8.0) {
                        Text("Anos")
                            .font(.body1)
                            .foregroundStyle(.indigo600)
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
                            .foregroundStyle(.indigo600)
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
                            .foregroundStyle(.indigo600)
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
                            .foregroundStyle(.indigo600)
                            .frame(maxWidth: .infinity)
                        Text("\(result) anos")
                            .contentTransition(.numericText())
                            .foregroundStyle(.indigo600)
                            .font(.display)
                            .frame(maxWidth: .infinity)
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
                            Color.indigo600
                            Text("Cãocular")
                                .foregroundStyle(.white)
                                .font(.body1)
                        }
                    })
                    .cornerRadius(12)
                    .frame(height: 50)
                }
                .containerRelativeFrame(.vertical)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
                .bold()
                .fontDesign(.rounded)
                .padding()
                .navigationTitle("Cãoculadora")
                .toolbarBackground(.visible, for: .navigationBar)
                .toolbarBackground(.indigo600, for: .navigationBar)
                .toolbarColorScheme(.dark, for: .navigationBar, .tabBar)
//                .fontDesign(.rounded)
                .alert(tituloPreencherCampos, isPresented: $failedInput) {
                    Button("OK", role: .cancel, action: {})
                }
                .alert(tituloCamposZero, isPresented: $zeroInput) {
                    Button("OK", role: .cancel, action: {})
                }
            }
            .scrollDismissesKeyboard(.immediately)
            .background(Color.white200)
        }
        
    }
    
    // Cálculo
    func processYears() {
        guard
            let years,
            let months
        else {
            print("Preencha o campo de entrada")
            failedInput = true
            return
        }
        guard years > 0 || months > 0 else {
            print("Algum campo tem que ter valor maior que zero")
            zeroInput = true
            return
        }
        withAnimation(.easeIn.speed(2.0)) {
            result = porteSelecionado.conversaoDeIdade(
                anos: years,
                meses: months
            )
        }
    }
}

#Preview {
    ContentView()
}
