//
//  ContentView.swift
//  macos-move-window-practice
//
//  Created by soudegesu on 2021/04/10.
//

import SwiftUI

struct ContentView: View {
    
  var body: some View {
    VStack {
      Button(action: {
        debugPrint("Button is clicked")
      }) {
        Text("Hello, World!")
      }
      .padding()
      .moveWindowWithDrag()
    }.frame(width: 300, height: 300)
  }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
