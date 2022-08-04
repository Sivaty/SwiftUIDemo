//
//  MatchedView.swift
//  DesignCode
//
//  Created by Link on 2022/7/30.
//

import SwiftUI

struct MatchedView: View {
    @Namespace var namespace
    @State var show = false
    
    var body: some View {
        ZStack {
            if !show {
                CourseItem(namespace: namespace, show: $show)
            } else {
                CourseView(namespace: namespace, show: $show)
            }
        }
        .onTapGesture {
            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                show.toggle()
            }
        }
    }
}

struct MatchedView_Previews: PreviewProvider {
    static var previews: some View {
        MatchedView()
    }
}
