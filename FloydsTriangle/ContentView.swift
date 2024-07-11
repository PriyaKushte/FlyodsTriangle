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
    @State private var showResult: Bool = false
    @State private var showError: Bool = false
    
    var body: some View {
        VStack {
            Text("Flyod's Triangle")
                .fontWeight(.bold)
                .font(.largeTitle)
                .foregroundColor(.gray)
            
            TextField(
                "Enter number of rows",
                text: $rowNo
            )
            .textFieldStyle(.roundedBorder)
            .padding()
            
            Button ("Generate") {
                // Action to perform
                drawTriangle()
            }
            .buttonStyle(.bordered)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
            .padding(.bottom, 30)
            
            if !errorMessage.isEmpty {
                Text(errorMessage)
                    .foregroundColor(.red)
            }
            
            if !resultText.isEmpty {
                Text(resultText)
                    .multilineTextAlignment(.leading)
                    .padding()
                    .background(Color.green.opacity(0.1))
                    .cornerRadius(8)
                    .transition(.opacity)
                    .animation(.easeInOut, value: 0.5)
                    .font(.title)

            }
        }
    }
    
    func drawTriangle() {
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
                }
                withAnimation {
                    resultText = result
                    errorMessage = ""
                    showResult = true
                    showError = false
                }
            } else {
                withAnimation {
                    resultText = ""
                    errorMessage = "Invalid input"
                    showResult = false
                    showError = true
                }
            }
        }
}

#Preview {
    ContentView()
}
