//
//  Order.swift
//  avocados
//
//  Created by sengshuaibin on 2021/6/24.
//

import UIKit

enum Spread: CaseIterable, Hashable {
    case none
    case almondButter
    case peanutButter
    case honey
}

struct Order {
    var includeSalt = false
    var includeRedPepperFlakes = false
    var quantity = 1
    var spread: Spread = .none
    var includeEgg = true
}
