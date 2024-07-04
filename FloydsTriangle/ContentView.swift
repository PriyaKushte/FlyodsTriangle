//
//  ContentView.swift
//  FloydsTriangle
//
//  Created by Priya Kushte on 04/07/24.
//

import SwiftUI

struct ContentView: View {
    @State private var rowNo: String = ""
    @State private var resultText: String = ""
        @State private var errorMessage: String = ""
    
    var body: some View {
        VStack {
            Text("Flyod's Triangle")
                .fontWeight(.bold)
                .font(.largeTitle)
            
            TextField(
                "Enter number of rows",
                text: $rowNo
            )
            .textFieldStyle(.roundedBorder)
            .padding()
            
            Button ("Generate") {
                // Action to perform
                drawTriangle(rowNo: rowNo)
            }
            .buttonStyle(.bordered)
            
            if !errorMessage.isEmpty {
                Text(errorMessage)
                    .foregroundColor(.red)
            }
            
            if !resultText.isEmpty {
                Text(resultText)
                    .multilineTextAlignment(.leading)
                    .padding()
            }
        }
    }
    
    func drawTriangle(rowNo: String) {
        
        if let rowNoInt = Int(rowNo), rowNoInt > 0 {
            var currentNumber = 1
            var result = ""
            for i in 1...rowNoInt {
                var row = ""
                for _ in 1...i {
                    row += "\(currentNumber) "
                    currentNumber += 1
                }
               result += row.trimmingCharacters(in: .whitespaces) + "\n"
                resultText = result
                errorMessage = ""
            }
        } else {
            resultText = ""
            errorMessage = "Invalid input"
        }
    }
}

#Preview {
    ContentView()
}
