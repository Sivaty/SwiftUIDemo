//
//  ContentView.swift
//  Rooms
//
//  Created by sengshuaibin on 2021/6/24.
//

import SwiftUI

struct ContentView: View {
    var rooms: [Room] = testData
    
    var body: some View {
        NavigationView {
            List(rooms) { room in
                RoomCell(room: room)
            }

            .navigationBarTitle("Rooms")
//            .navigationBarItems(trailing: EditButton())
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(rooms: testData)
            ContentView(rooms: testData)
                .environment(\.sizeCategory, .extraExtraExtraLarge)
            ContentView(rooms: testData)
                .environment(\.colorScheme, .dark)
        }
    }
}

struct RoomCell: View {
    let room: Room
    var body: some View {
        NavigationLink(destination: RoomDetail(room: room)) {
            Image(room.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50.0, height: 50.0)
                .cornerRadius(3.0)
            VStack(alignment: .leading) {
                Text(room.name)
                Text("\(room.capcity) people")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}
