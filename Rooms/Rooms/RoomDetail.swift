//
//  RoomDetail.swift
//  Rooms
//
//  Created by sengshuaibin on 2021/6/24.
//

import SwiftUI

struct RoomDetail: View {
    let room: Room
    @State private var zoomed = false
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Image(room.imageName)
                .resizable()
                .aspectRatio(contentMode: zoomed ? .fill : .fit)
                .navigationBarTitle(Text(room.name), displayMode: .inline)
                .onTapGesture {
                    withAnimation { zoomed.toggle() }
                    
                }
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,  maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            if room.hasVideo, !zoomed {
                Image(systemName: "video.fill")
                    .foregroundColor(.blue)
                    .font(.title)
                    .padding()
                    .transition(.move(edge: .leading))
            }
        }
    }
}

struct RoomDetail_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RoomDetail(room: testData[0])
            RoomDetail(room: testData[1])
        }
    }
}
