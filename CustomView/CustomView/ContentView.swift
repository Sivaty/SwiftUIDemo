//
//  ContentView.swift
//  CustomView
//
//  Created by sengshuaibin on 2021/6/25.
//

import SwiftUI

// case 1

//struct ContentView: View {
//    @State var counter = 0
//
//    var body: some View {
//        VStack {
//            Button(action: { counter += 1 }, label: {
//                Text("Tap me!")
//                    .padding()
//                    .background(Color(.tertiarySystemFill))
//                    .cornerRadius(5)
//            })
//
//            if counter > 0 {
//                Text("You've tapped \(counter) times")
//            } else {
//                Text("You've not yet tapped")
//            }
//        }
//        .frame(width: 200, height: 200)
//        .border(Color.black)
//    }
//}


// case 2

//struct LabelView: View {
//    let number: Int
//    var body: some View {
//        print("LabelView")
//        return Group {
//            if number > 0 {
//                Text("You've tapped \(number) times")
//            }
//        }
//    }
//}
//
//struct ContentView: View {
//    @State var counter = 0
//    var body: some View {
//        print("ContentView")
//        return VStack {
//            Button("Tap me!") { self.counter += 1 }
//            LabelView(number: counter)
//        }
//    }
//}

// case 3

//struct LabelView: View {
//    @State var counter = 0
//    var body: some View {
//        print("LabelView")
//        return VStack {
//            Button("Tap me!") { self.counter += 1 }
//            if counter > 0 {
//                Text("You've tapped \(counter) times")
//            }
//        }
//    }
//}
//struct ContentView: View {
//    var body: some View {
//        print("ContentView")
//        return LabelView()
//    }
//}


// case 4

struct LabelView: View {
    @Binding var number: Int
    var body: some View {
        print("LabelView")
        return Group {
            if number > 0 {
                Text("You've tapped \(number) times")
            }
        }
    }
}

struct ContentView: View {
    @State var counter = 0
    @State var userAgreed = false
    
    var body: some View {
        VStack {
            ColorPicker(/*@START_MENU_TOKEN@*/"Title"/*@END_MENU_TOKEN@*/, selection: .constant(.red))
            DatePicker(selection: /*@START_MENU_TOKEN@*/.constant(Date())/*@END_MENU_TOKEN@*/, label: { /*@START_MENU_TOKEN@*/Text("Date")/*@END_MENU_TOKEN@*/ })
            Button("Tap me!") { self.counter += 1 }
            LabelView(number: $counter)
            DisclosureGroup(/*@START_MENU_TOKEN@*/"Group"/*@END_MENU_TOKEN@*/) {
                DatePicker(selection: /*@START_MENU_TOKEN@*/.constant(Date())/*@END_MENU_TOKEN@*/, label: { /*@START_MENU_TOKEN@*/Text("Date")/*@END_MENU_TOKEN@*/ })
            }
            
            EditButton()
            
            Gauge(value: /*@START_MENU_TOKEN@*/0.5/*@END_MENU_TOKEN@*/, in: /*@START_MENU_TOKEN@*/0...1/*@END_MENU_TOKEN@*/) {
                /*@START_MENU_TOKEN@*/Text("Label")/*@END_MENU_TOKEN@*/
            }
            
            
            GroupBox(label:
                Label("End-User Agreement", systemImage: "building.columns")
            ) {
                ScrollView(.vertical, showsIndicators: true) {
                    Text("agreementText")
                        .font(.footnote)
                }
                .frame(height: 100)
                Toggle(isOn: $userAgreed) {
                    Text("I agree to the above terms")
                }
            }
           
            ProgressView(value: 0.5)
            
            RenameButton()
            
        }
        .padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
