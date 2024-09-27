//
//  MoexCalculatorApp.swift
//  MoexCalculator
//
//  Created by Дмитрий Матвеев on 26.09.2024.
//

import SwiftUI

@main
struct MoexCalculatorApp: App {
    @StateObject var viewModel = CalculatorViewModel()
     
     var body: some Scene {
         WindowGroup {
             MainView()
                 .environmentObject(viewModel)
         }
     }
}
