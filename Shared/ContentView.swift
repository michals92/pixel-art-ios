//
//  ContentView.swift
//  Shared
//
//  Created by Michal Šimík on 12.11.2021.
//

import SwiftUI

struct ContentView : View {
    var body: some View {
        VStack {
            Text("NFT pixel art!")
            PixelCanvasView(size: 10)
        }
    }
}

struct PixelCanvasView : View {

    private let spacing: CGFloat = 0.5

    var rangeArray: [Int] = []

    @State private var colors: [[Color]] = []
    @State private var sizeString: String = ""

    init(size: Int) {
        generateCanvas(size: size)
    }

    mutating func generateCanvas(size: Int) {
        rangeArray = Array(0..<size)

        var colorArray: [Color] = []
        var colors: [[Color]] = []

        for _ in 0..<size {
            colorArray.append(.black)
        }

        for _ in 0..<size {
            colors.append(colorArray)
        }

        self._colors = State(initialValue: colors)
    }

    var body: some View {
        HStack {
            TextField("Number of pixels", text: $sizeString)
                .padding()
                .keyboardType(.numberPad)
            Button(action: {
              //  generateCanvas(size: Int(sizeString) ?? 10)
            }) {
                Text("Generate new canvas")
            }.padding()
        }

        GeometryReader { geometry in
            HStack(alignment: .center, spacing: spacing) {
                ForEach(rangeArray, id: \.self) { row in
                    VStack(alignment: .center, spacing: spacing) {
                        ForEach(rangeArray, id: \.self) { column in
                            Button(action: {
                                colors[column][row] = .red
                            }) {
                                Rectangle().fill(colors[column][row])
                            }
                        }
                    }
                }
            }.frame(width: geometry.size.width, height: geometry.size.width, alignment: .center)
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.portrait)
    }
}
#endif
