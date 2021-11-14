//
//  CanvasViewModel.swift
//  nft-pixel-art
//
//  Created by Michal Šimík on 14.11.2021.
//

import SwiftUI

final class CanvasViewModel: ObservableObject {
    @Published var item: Bool?
    @Published var colors: [[Color]] = []
    @Published var sizeString: String = ""

    let spacing: CGFloat = 0.5

    init() {
        generateCanvas(size: 10)
    }

    @Published var rangeArray: [Int] = []

    func generateCanvas(size: Int) {
        rangeArray = Array(0..<size)

        var colorArray: [Color] = []
        var colors: [[Color]] = []

        for _ in 0..<size {
            colorArray.append(.black)
        }

        for _ in 0..<size {
            colors.append(colorArray)
        }

        self.colors = colors
    }
}
