//
//  ContentView.swift
//  FlexibleBorders
//
//  Created by Corey Davis on 3/12/23.
// 
//  License: MIT License https://opensource.org/license/mit/
//
// Copyright 2023 Corey Davis
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the “Software”), to
// deal in the Software without restriction, including without limitation the
// rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
// sell copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
// DEALINGS IN THE SOFTWARE.
//

import SwiftUI

struct ContentView: View {
    var grid: [[String]] = [["🍏", "🍌", "🫐"], ["🍇", "🍓", "🍉"]]
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "square.dashed.inset.filled")
                Text("Flexible Borders")
            }
            .font(.largeTitle)
            .frame(maxWidth: .infinity)
            .padding()
            .bordered(edges: .all)
            
            Spacer()
            
            Grid {
                ForEach(grid, id: \.self) { row in
                    GridRow {
                        ForEach(row, id: \.self) { item in
                            Text("\(item)")
                                .font(.largeTitle)
                                .padding()
                        }
                    }
                    .bordered(edges: [.bottom, .trailing], color: .cyan, width: 3.0)
                    .padding()
                }
            }
            .bordered(edges: [.top, .bottom], color: .purple)
            
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
