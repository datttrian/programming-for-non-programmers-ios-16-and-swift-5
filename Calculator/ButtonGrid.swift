//
//  ButtonGrid.swift
//  Calculator
//
//  Created by datttrian on 2024-01-12.
//

import SwiftUI

enum CalculatorMode {
    case notSet
    case addition
    case substraction
    case multiplication
}

struct ButtonGrid: View {
    @Binding var currentValue: String
    @State var currentMode: CalculatorMode = .notSet
    @State var lastButtonWasMode = false
    
    var body: some View {
        Grid {
            GridRow {
                CalculatorButton(buttonText: "1", action: numberWasPressed)
                CalculatorButton(buttonText: "2", action: numberWasPressed)
                CalculatorButton(buttonText: "3", action: numberWasPressed)
                CalculatorButton(color: .orange, buttonText: "+", action: modeWasPressed, mode: .addition)
            }
            GridRow {
                CalculatorButton(buttonText: "4", action: numberWasPressed)
                CalculatorButton(buttonText: "5", action: numberWasPressed)
                CalculatorButton(buttonText: "6", action: numberWasPressed)
                CalculatorButton(color: .orange, buttonText: "-", action: modeWasPressed, mode: .substraction)
            }
            GridRow {
                CalculatorButton(buttonText: "7", action: numberWasPressed)
                CalculatorButton(buttonText: "8", action: numberWasPressed)
                CalculatorButton(buttonText: "9", action: numberWasPressed)
                CalculatorButton(color: .orange, buttonText: "X", action: modeWasPressed, mode: .multiplication)
            }
            GridRow {
                CalculatorButton(width: 148, buttonText: "0", action: numberWasPressed)
                    .gridCellColumns(2)
                CalculatorButton(color: .gray, buttonText: "C", action: clearWasPressed)
                CalculatorButton(color: .orange, buttonText: "=", action: equalWasPressed)
            }
        }
        
    }
    
    func numberWasPressed(button: CalculatorButton) {
        if lastButtonWasMode {
            lastButtonWasMode = false
        }
        
        if let currentValueInt = Int(currentValue + button.buttonText) {
            currentValue = "\(currentValueInt)"
        } else {
            currentValue = "Error"
        }
    }
    
    func modeWasPressed(button: CalculatorButton) {
        currentMode = button.mode
        print("mode was pressed \(currentMode)")
        lastButtonWasMode = true
    }
    
    func clearWasPressed(button: CalculatorButton) {
        print("clear was pressed")
    }
    
    func equalWasPressed(button: CalculatorButton) {
        print("equal was pressed")
        if currentMode == .notSet || lastButtonWasMode {
            return
        }
    }
    
}

#Preview {
    ButtonGrid(currentValue: .constant("1"))
}
