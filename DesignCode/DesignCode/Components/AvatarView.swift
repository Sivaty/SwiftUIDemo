//
//  AvatarView.swift
//  DesignCode
//
//  Created by Link on 2022/10/11.
//

import SwiftUI

struct AvatarView: View {
    @AppStorage("isLogged") var isLogged = true
    
    var body: some View {
        Group {
            if isLogged {
                AsyncImage(url: URL(string: "https://img2.baidu.com/it/u=207830584,578278860&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=715"), transaction: Transaction(animation: .easeOut)) {
                    phase in
                    switch phase {
                    case .success(let image):
                        image.resizable()
                            .transition(.scale(scale: 0.5, anchor: .center))
                    case .empty:
                        ProgressView()
                    case .failure(_):
                        Color.gray
                    @unknown default:
                        EmptyView()
                    }
                }
            } else {
                Image("Avatar Default")
                    .resizable()
            }
        }
        .frame(width: 26, height: 26)
            .cornerRadius(10)
            .padding(8)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 18, style: .continuous))
        .strokeStyle(cornerRadius: 18)
    }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarView()
    }
}
