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
        
        func drawTriangle(rowNo: String) -> Void {
            if let rowNoInt = Int(rowNo){
                
                var numArr : [Int] = []
                var fromNum = 1
                var toNum = 1
                for i in 1...rowNoInt {
                    for j in fromNum...toNum {
                        numArr.append(j)
                    }
                    fromNum = toNum+1
                    toNum = fromNum+i
                    print(numArr)
                    numArr = []
                }
            }
            
        }
}

#Preview {
    ContentView()
}
