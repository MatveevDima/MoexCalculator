//
//  CalculatorView.swift
//  MoexCalculator
//
//  Created by Дмитрий Матвеев on 26.09.2024.
//

import SwiftUI

struct CalculatorView: View {
    
    @EnvironmentObject var viewModel: CalculatorViewModel
    @State private var isPickerPresented = false
    
    var body: some View {
        
        List {
            
            CurrencyInput(currency: viewModel.topCurrency, amount: viewModel.topAmount, calculator: viewModel.setTopAmount, tapHandler: { isPickerPresented.toggle() } )
            
            CurrencyInput(currency: viewModel.bottomCurrency, amount: viewModel.bottomAmount, calculator: viewModel.setBottomAmount, tapHandler: { isPickerPresented.toggle() } )
            
        }
        .foregroundColor(.accentColor)
        .onTapGesture {
            hideKeyboard()
        }
        .sheet(isPresented: $isPickerPresented) {
            VStack{
                Spacer(minLength: 16)
                
                RoundedRectangle(cornerRadius: 3)
                    .fill(.secondary)
                    .frame(width: 60, height: 6)
                    .onTapGesture {
                        isPickerPresented = false
                    }
                
                HStack {
                    CurrencyPicker(
                        currency: $viewModel.topCurrency, onChange: { _ in didChangeTopCurrency()
                        }
                    )
                    CurrencyPicker(
                        currency: $viewModel.bottomCurrency, onChange: { _ in
                            didChangeBottomCurrency()
                        }
                    )
                }
            }
            .presentationDetents([.fraction(0.3)])
        }
    }
    
    
    private func didChangeTopCurrency() {
        viewModel.updateTopAmount()
    }
    
    private func didChangeBottomCurrency() {
        viewModel.updateBottomAmount()
    }
    
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}

extension View {
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
