//
//  ContentView.swift
//  DesignCode
//
//  Created by Link on 2022/7/23.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    
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
            
//            HomeView()
            TabBar()
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
//            ContentView()
//                .preferredColorScheme(.dark)
        }
    }
}
