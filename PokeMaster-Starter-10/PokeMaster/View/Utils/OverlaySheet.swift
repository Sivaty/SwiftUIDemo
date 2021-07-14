//
//  OverlaySheet.swift
//  PokeMaster
//
//  Created by 王 巍 on 2019/09/30.
//  Copyright © 2019 OneV's Den. All rights reserved.
//

import Foundation
import SwiftUI

struct PokemonInfoPanelOverlay: View {
    let model: PokemonViewModel
    var body: some View {
        VStack {
            Spacer()
            PokemonInfoPanel(model: model)
        }
        .edgesIgnoringSafeArea(.bottom)

    }
}

struct OverlaySheet<Content: View>: View {
    private let isPresented: Binding<Bool>
    private let makeContent: () -> Content
    
    @GestureState private var translation = CGPoint.zero
    
    var panelDraggingGesture: some Gesture {
        // 1
        DragGesture()
        // 2
            .updating($translation) { current, state, _ in
                state.y = current.translation.height
            }
        // 3
            .onEnded { state in
                if state.translation.height > 250 {
                    self.isPresented.wrappedValue = false
                }
            }
    }
    
    init(
        isPresented: Binding<Bool>,
        @ViewBuilder content: @escaping () -> Content
    )
        {
            self.isPresented = isPresented
            self.makeContent = content
        }
    
    var body: some View {
        VStack {
            Spacer()
            makeContent()
        }
        .offset(y: isPresented.wrappedValue ?
                0 : UIScreen.main.bounds.height)
        .animation(.interpolatingSpring(stiffness: 70, damping: 12))
        .edgesIgnoringSafeArea(.bottom)
        .gesture(panelDraggingGesture)
    }
}

extension View {
func overlaySheet<Content: View>(
    isPresented: Binding<Bool>,
    @ViewBuilder content: @escaping () -> Content
) -> some View
    {
        overlay(
            OverlaySheet(isPresented: isPresented, content: content)
        )
    }
}
