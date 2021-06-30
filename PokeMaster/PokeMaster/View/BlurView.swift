//
//  BlurView.swift
//  PokeMaster
//
//  Created by sengshuaibin on 2021/6/29.
//  Copyright © 2021 OneV's Den. All rights reserved.
//

import UIKit
import SwiftUI

struct BlurView: UIViewRepresentable {
    // 1
    let style: UIBlurEffect.Style
    
    init(style: UIBlurEffect.Style) {
        print("Init")
        self.style = style
    }
    
    func makeUIView(
        context: UIViewRepresentableContext<BlurView>
    ) -> UIView
    {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        let blurEffect = UIBlurEffect(style: style)
        let blurView = UIVisualEffectView(effect: blurEffect)
        // 2
        blurView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(blurView)
        NSLayoutConstraint.activate([
            blurView.heightAnchor
                .constraint(equalTo: view.heightAnchor),
            blurView.widthAnchor
                .constraint(equalTo: view.widthAnchor)
        ])
        print("makeUIView")
        return view
    }
    
    // 3
    func updateUIView(
        _ uiView: UIView,
        context: UIViewRepresentableContext<BlurView>)
    {
        for item in uiView.subviews {
            item.removeFromSuperview()
        }
        let blurEffect = UIBlurEffect(style: style)
        let blurView = UIVisualEffectView(effect: blurEffect)
        // 2
        blurView.translatesAutoresizingMaskIntoConstraints = false
        uiView.addSubview(blurView)
        NSLayoutConstraint.activate([
            blurView.heightAnchor
                .constraint(equalTo: uiView.heightAnchor),
            blurView.widthAnchor
                .constraint(equalTo: uiView.widthAnchor)
        ])
    }
}


extension View {
    func blurBackground(style: UIBlurEffect.Style) -> some View {
        ZStack {
            BlurView(style: style)
            self
        }
    }
}
