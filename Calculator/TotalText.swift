//
//  TotalText.swift
//  Calculator
//
//  Created by datttrian on 2024-01-12.
//

import SwiftUI

struct TotalText: View {
    var value = "0"
    var body: some View {
        Text(value)
            .font(.system(size: 60))
            .foregroundColor(.white)
            .fontWeight(.light)
            .padding()
            .frame(width: 300, alignment: .trailing)
            .lineLimit(1)
    }
}

#Preview {
    TotalText()
                .background(.black)
}
