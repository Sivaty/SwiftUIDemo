//
//  ContentView.swift
//  DesignCode
//
//  Created by Link on 2022/7/23.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    @EnvironmentObject var model: Model
    @AppStorage("showModal") var showModal = false
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            switch selectedTab {
            case .home:
                HomeView()
//                Text(selectedTab.rawValue)
            case .explore:
                Text(selectedTab.rawValue)
            case .notifications:
                Text(selectedTab.rawValue)
            case .library:
                Text(selectedTab.rawValue)
            }
            
            TabBar()
                .offset(y: model.showDetail ? 200 : 0)
            if showModal {
                ModalView()
                .zIndex(1)
            }
        }
        .safeAreaInset(edge: .bottom) {
            Color.clear.frame(height: 44)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .environmentObject(Model())
//            ContentView()
//                .preferredColorScheme(.dark)
        }
    }
}
