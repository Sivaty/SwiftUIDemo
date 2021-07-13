//
//  SafariView.swift
//  PokeMaster
//
//  Created by sengshuaibin on 2021/7/13.
//  Copyright © 2021 OneV's Den. All rights reserved.
//

import Foundation
import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable {
    let url: URL
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<Self>) -> SFSafariViewController {
        let controller = SFSafariViewController(url: url)
        return controller
    }


    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<Self>) {
        
    }
}
