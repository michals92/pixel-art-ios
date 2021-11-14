//
//  CanvasView.swift
//  nft-pixel-art
//
//  Created by Michal Šimík on 14.11.2021.
//

import SwiftUI

struct CanvasView: View {
    @StateObject private var viewModel = CanvasViewModel()

    var body: some View {
        HStack {
            TextField("Number of pixels", text: $viewModel.sizeString)
                .padding()
                .keyboardType(.numberPad)
            Button(action: {
                viewModel.generateCanvas(size: Int(viewModel.sizeString) ?? 10)
            }) {
                Text("Generate new canvas")
            }.padding()
        }

        GeometryReader { geometry in
            HStack(alignment: .center, spacing: viewModel.spacing) {
                ForEach(viewModel.rangeArray, id: \.self) { row in
                    VStack(alignment: .center, spacing: viewModel.spacing) {
                        ForEach(viewModel.rangeArray, id: \.self) { column in
                            Button(action: {
                                viewModel.colors[column][row] = .red
                            }) {
                                Rectangle().fill(viewModel.colors[column][row])
                            }
                        }
                    }
                }
            }.frame(width: geometry.size.width, height: geometry.size.width, alignment: .center)
        }
    }
}

