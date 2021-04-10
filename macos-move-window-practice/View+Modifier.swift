//
//  View+Modifier.swift
//  macos-move-window-practice
//
//  Created by soudegesu on 2021/04/10.
//

import SwiftUI

class DraggableNSView: NSView {

  private var isDragging: Bool = false
  private var isFirstMouse: Bool = false
  
  override public func mouseDown(with event: NSEvent) {
    debugPrint("mouseDown")
    window?.performDrag(with: event)
  }
  
  override public func mouseUp(with event: NSEvent) {
    // Fire mouseUp event twice when firstMouse  triggered
    if isFirstMouse {
      isFirstMouse = false
      return
    }

    debugPrint("mouseUp")
    if !isDragging {
      super.mouseDown(with: event)
      super.mouseUp(with: event)
    }
    
    isDragging = false
  }
    
  override public func mouseDragged(with event: NSEvent) {
    debugPrint("mouseDragged")
    isDragging = true
  }
    
  override func acceptsFirstMouse(for event: NSEvent?) -> Bool {
    switch (event?.type) {
    case .leftMouseDown:
      isFirstMouse = true
      return true
    default:
      return false
    }
  }
}

struct DraggableView: NSViewRepresentable {
  typealias NSViewType = DraggableNSView

  func makeNSView(context: Context) -> DraggableNSView {
    let view = DraggableNSView()
    return view
  }
  
  func updateNSView(_ nsView: DraggableNSView, context: Context) {}
}

struct DraggableModifier: ViewModifier {

  func body(content: Content) -> some View {
    content.overlay(DraggableView())
  }
}

extension View {
  func moveWindowWithDrag() -> some View {
    modifier(DraggableModifier())
  }
}
