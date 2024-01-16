//
//  ButtonGrid.swift
//  Calculator
//
//  Created by datttrian on 2024-01-12.
//

import SwiftUI

struct ButtonGrid: View {
    @Binding var currentValue: String
    var body: some View {
        Grid {
            GridRow {
                CalculatorButton(buttonText: "1", action: numberWasPressed)
                CalculatorButton(buttonText: "2", action: numberWasPressed)
                CalculatorButton(buttonText: "3", action: numberWasPressed)
                CalculatorButton(color: .orange, buttonText: "+", action: modeWasPressed)
            }
            GridRow {
                CalculatorButton(buttonText: "4", action: numberWasPressed)
                CalculatorButton(buttonText: "5", action: numberWasPressed)
                CalculatorButton(buttonText: "6", action: numberWasPressed)
                CalculatorButton(color: .orange, buttonText: "-", action: modeWasPressed)
            }
            GridRow {
                CalculatorButton(buttonText: "7", action: numberWasPressed)
                CalculatorButton(buttonText: "8", action: numberWasPressed)
                CalculatorButton(buttonText: "9", action: numberWasPressed)
                CalculatorButton(color: .orange, buttonText: "X", action: modeWasPressed)
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
        let currentValueInt = Int(currentValue + button.buttonText)!
        currentValue = "\(currentValueInt)"
    }
    
    func modeWasPressed(button: CalculatorButton) {
        print("mode was pressed")
    }
    
    func clearWasPressed(button: CalculatorButton) {
        print("clear was pressed")
    }
    
    func equalWasPressed(button: CalculatorButton) {
        print("equal was pressed")
    }
    
}

#Preview {
    ButtonGrid(currentValue: .constant("1"))
}
