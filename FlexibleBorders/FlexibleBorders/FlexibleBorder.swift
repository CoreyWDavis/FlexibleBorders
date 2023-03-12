//
//  FlexibleBorder.swift
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

/// Draws a border around the view's edges using the specified edge values,
/// stroke color, and width.
struct Bordered: ViewModifier {
    var edges: Edge.Set = .all
    var color: Color = .black
    var width: CGFloat = 1.0
    func body(content: Content) -> some View {
        content
            .overlay {
                GeometryReader { geometry in
                    paths(in: geometry.frame(in: .local))
                        .strokedPath(.init(lineCap: .butt))
                        .stroke(color, lineWidth: width)
                }
            }
    }
    
    @ViewBuilder private func paths(in frame: CGRect) -> Path {
        Path { path in
            if edges.contains(.top) || edges.contains(.all) {
                path.move(to: CGPoint(x: frame.maxX, y: frame.minY))
                path.addLine(to: CGPoint(x: frame.minX, y: frame.minY))
            }
            if edges.contains(.trailing) || edges.contains(.all) {
                path.move(to: CGPoint(x: frame.maxX, y: frame.maxY))
                path.addLine(to: CGPoint(x: frame.maxX, y: frame.minY))
            }
            if edges.contains(.bottom) || edges.contains(.all) {
                path.move(to: CGPoint(x: frame.minX, y: frame.maxY))
                path.addLine(to: CGPoint(x: frame.maxX, y: frame.maxY))
            }
            if edges.contains(.leading) || edges.contains(.all) {
                path.move(to: CGPoint(x: frame.minX, y: frame.maxY))
                path.addLine(to: CGPoint(x: frame.minX, y: frame.minY))
            }
            path.closeSubpath()
        }
    }
}

extension View {
    /// Draws a border around the view's edges using the specified edge values,
    /// stroke color, and width.
    ///
    /// - Parameters:
    ///   - edges: The set of edges the border will be drawn on for the content view.
    ///     The default is `.all`.
    ///   - color: A `Color` value that will be used as the stroke color
    ///     of the border's path. The default is `.black`.
    ///   - width: The width of the border's line. The default is 1.
    ///
    /// - Returns: A view that adds a border with the specified color and width
    ///   to the content view.
    func bordered(edges: Edge.Set, color: Color = .black, width: CGFloat = 1.0) -> some View {
        modifier(Bordered(edges: edges, color: color, width: width))
    }
}
