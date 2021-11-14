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
            CanvasView()
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
