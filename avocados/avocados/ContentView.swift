//
//  ContentView.swift
//  avocados
//
//  Created by sengshuaibin on 2021/6/24.
//

import SwiftUI

struct ContentView: View {
    @State var order = Order()
    
    var body: some View {
//        VStack {
//            Text("Avocado Toast").font(.title)
//            Toggle(isOn: $order.includeSalt) {
//                Text("Include Salt")
//            }
//            Toggle(isOn: $order.includeRedPepperFlakes) {
//                Text("Include Red Pepper Flakes")
//            }
//            Stepper(value: $order.quantity, in: 1...10) {
//                Text("Quantity: \(order.quantity)")
//            }
//      
//            Button(action: submitOrder) {
//                VStack {
//                    Image(systemName: "photo")
//                    Text("Order")
//                }
//            }
//         }
//        .padding()
//        Picker(selection: $order.spread, label: Text("Spread")) {
//            Text("None").tag(Spread.none)
//            Text("Almond Butter").tag(Spread.almondButter)
//            Text("Peanut Butter").tag(Spread.peanutButter)
//            Text("Hone").tag(Spread.honey)
//        }
//        Picker(selection: $order.spread, label: Text("Spread")) {
//            ForEach(Spread.AllCases) { spread in
//                Text(spread.description).tag(spread)
//            }
//        }
        
        NavigationView {
            TabView {
                OrderForm(order: order)
                    .tabItem {
                        Image(systemName: "square.and.pencil")
                        Text("New Order")
                    }.tag(1)
                Text("Tab Content 2").tabItem { /*@START_MENU_TOKEN@*/Text("Tab Label 2")/*@END_MENU_TOKEN@*/ }.tag(2)
            }
        }
    }
    
    func submitOrder() {
        print(order)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct OrderForm : View {
    @State var order: Order
    
    var body: some View {
        List {
            Toggle(isOn: $order.includeEgg) {
                Text("Include Egg")
            }
            if order.includeEgg {
                NavigationLink(destination: Text("Egg Location")) {
                    Text("Egg Location")
                }
            }
        }
        .navigationBarTitle(Text("Avocado Toast"))
    }
}
