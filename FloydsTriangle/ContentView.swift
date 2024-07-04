//
//  ContentView.swift
//  FloydsTriangle
//
//  Created by Priya Kushte on 04/07/24.
//

import SwiftUI

struct ContentView: View {
    @State private var rowNo: String = ""

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
                
            }
        }
        
    func drawTriangle(rowNo: String) {
        
        if let rowNoInt = Int(rowNo) {
            var currentNumber = 1
            for i in 1...rowNoInt {
                var row = ""
                for _ in 1...i {
                    row += "\(currentNumber) "
                    currentNumber += 1
                }
                print(row.trimmingCharacters(in: .whitespaces))
            }
        } else {
            print("Invalid input")
        }
    }
}

#Preview {
    ContentView()
}
