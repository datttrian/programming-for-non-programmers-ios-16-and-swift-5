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
    @State var savedIn = 0
    @State var currentInt = 0
    
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
            currentInt = 0
        }
        
        if let currentValueInt = Int("\(currentInt)" + button.buttonText) {
            //            currentValue = "\(currentValueInt)"
            currentInt = currentValueInt
            updateText()
        } else {
            currentValue = "Error"
            currentInt = 0
        }
    }
    
    func modeWasPressed(button: CalculatorButton) {
        currentMode = button.mode
        print("mode was pressed \(currentMode)")
        lastButtonWasMode = true
    }
    
    func clearWasPressed(button: CalculatorButton) {
        currentValue = "0"
        currentMode = .notSet
        lastButtonWasMode = false
        savedIn = 0
        currentInt = 0
        print("clear was pressed")
    }
    
    func equalWasPressed(button: CalculatorButton) {
        print("equal was pressed")
        if currentMode == .notSet || lastButtonWasMode {
            return
        }
        
        if currentMode == .addition {
            savedIn += currentInt
        } else if currentMode == .substraction {
            savedIn -= currentInt
        } else if currentMode == .multiplication {
            savedIn *= currentInt
        }
        
        currentInt = savedIn
        updateText()
        lastButtonWasMode = true
    }
    
    func updateText() {
        if currentMode == .notSet {
            savedIn = currentInt
        }
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        currentValue = formatter.string(for: currentInt) ?? "Error"
    }
    
}

#Preview {
    ButtonGrid(currentValue: .constant("1"))
}
