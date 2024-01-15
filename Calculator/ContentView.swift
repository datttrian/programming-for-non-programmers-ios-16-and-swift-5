//
//  ContentView.swift
//  Calculator
//
//  Created by datttrian on 2024-01-12.
//

import SwiftUI

struct ContentView: View {
    @State var currentValue: String = "0"
    var body: some View {
        ZStack {
            Color.black
            VStack {
                TotalText(value: currentValue)
                ButtonGrid(currentValue: $currentValue)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
