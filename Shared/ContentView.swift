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
            PixelCanvasView(itemsCount: 6)
        }
    }
}

struct PixelCanvasView : View {

    let itemsCount: Int
    let spacing: CGFloat = 1

    let rangeArray: [Int]

    @State private var colors: [[Color]] = []

    var size: CGFloat = 0 {
        didSet {
            print(size)
        }
    }

    init(itemsCount: Int) {
        self.itemsCount = itemsCount
        rangeArray = Array(0..<itemsCount)

        var colorArray: [Color] = []
        var colors: [[Color]] = []

        for _ in 0..<itemsCount {
            colorArray.append(.black)
        }

        for _ in 0..<itemsCount {
            colors.append(colorArray)
        }

        self._colors = State(initialValue: colors)

        print(colors.count)

    }

    var body: some View {
        GeometryReader { geometry in
            let size = geometry.size.width / (CGFloat(itemsCount)-CGFloat(itemsCount)*spacing)

            HStack(alignment: .center, spacing: spacing) {
                ForEach(rangeArray, id: \.self) { row in
                    VStack(alignment: .center, spacing: spacing) {
                        ForEach(rangeArray, id: \.self) { column in
                            Button(action: {
                                print(row)
                                print(column)

                                colors[column][row] = .red
                            }) {
                                Text(" alsfkaos njafsjn f")//.font(.system(size: geometry.size.width/20))
                                 //   .foregroundColor(.white)
                                    .background(colors[column][row])
                                    .frame(width: size, height: size, alignment: .center)
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
