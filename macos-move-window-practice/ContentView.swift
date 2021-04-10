//
//  ContentView.swift
//  macos-move-window-practice
//
//  Created by soudegesu on 2021/04/10.
//

import SwiftUI

struct ContentView: View {
  
  private let buttonLabels = [
    "Label A",
    "Label B",
    "Label C"
  ]
  
  var body: some View {
    VStack {
      ForEach(buttonLabels.indices, id: \.self) { index in
        Button(action: {
          debugPrint("\(buttonLabels[index]) is clicked")
        }) {
          Text(buttonLabels[index])
        }
        .padding()
        .moveWindowWithDrag()
      }
    }.frame(width: 300, height: 300)
  }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
