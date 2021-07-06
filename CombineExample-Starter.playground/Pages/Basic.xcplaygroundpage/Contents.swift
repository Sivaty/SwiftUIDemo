import Combine
import Foundation

check("Empty") {
    Empty<Int, SampleError>()
}

check("Just") {
    Just("Hello SwiftUI")
}

check("Sequence") {
//    Publishers.Sequence<[Int], Never>(sequence: [1, 2, 3])
    [1, 2, 3].publisher
}

check("map") {
//    Publishers.Sequence<[Int], Never>(sequence: [1, 2, 3])
    [1, 2, 3].publisher
        .map { $0 * 2}
}

check("map just") {
    Just(5).map { $0 * 2}
}

check("reduce") {
    [1, 2, 3, 4, 5].publisher.reduce(0, +)
}

check("scanr") {
    [1, 2, 3, 4, 5].publisher.scan(0, +)
}

check("compactMap") {
    ["1", "2", "3", "cat", "4", "5"].publisher.compactMap { Int($0) }
}

check("flatMap1") {
    [[1, 2, 3], ["a", "b", "c"]].publisher.flatMap { $0.publisher }
}

check("Flat Map 2") {
    ["A", "B", "C"]
        .publisher
        .flatMap { letter in
            [1, 2, 3]
                .publisher
                .map { "\(letter)\($0)" }
        }
}

check("Remove Duplicates") {
    ["S", "Sw", "Sw", "Sw", "Swi",
     "Swif", "Swift", "Swift", "Swif"]
        .publisher
        .removeDuplicates()
}

check("Fail") {
Fail<Int, SampleError>(error: .sampleError)
}

check("Catch and Continue") {
    ["1", "2", "Swift", "4"].publisher
        .print("[ Original ]")
        .flatMap { s in
            return Just(s)
                .tryMap { s -> Int in
                    guard let value = Int(s) else {
                        throw SampleError.sampleError
                    }
                    return value
                }
                .print("[ TryMap ]")
                .catch { _ in
                    Just(-1).print("[ Just ]") }
                .print("[ Catch ]")
        }
}

check("Filter") {
    [1,2,3,4,5].publisher.filter { $0 % 2 == 0 }
}

check("Contains") {
[1,2,3,4,5].publisher
.print("[Original]")
.contains(10)
}

//check("merge") {
//    [1: "20", 3: "40", 4: "60"].timerPublisher.merge(with: [2: "1", 5: "1"].timerPublisher)
//}
//struct Response: Decodable {
//    struct Args: Decodable {
//        let foo: String
//    }
//    let args: Args?
//}
//
//let subscription = check("URL Session") {
//    URLSession.shared
//        .dataTaskPublisher(
//            for: URL(string: "https://httpbin.org/get?foo=bar")!)
//        .map { data, _ in data }
//        .decode(type: Response.self, decoder: JSONDecoder())
//        .compactMap { $0.args?.foo }
//}


//let timer = Timer.publish(every: 1, on: .main, in: .default)
//check("Timer") {
//    timer
//}
//timer.connect()

//class Clock {
//    var timeString: String = "--:--:--" {
//        didSet { print("\(timeString)") }
//    }
//}
//
//let clock = Clock()
//let formatter = DateFormatter()
//formatter.timeStyle = .medium
//let timer = Timer.publish(every: 1, on: .main, in: .default)
//var token = timer
//    .map { formatter.string(from: $0) }
//    .assign(to: \.timeString, on: clock)
//timer.connect()
//
//
//class LoadingUI {
//    var isSuccess: Bool = false
//    var text: String = ""
//}
//
//struct Response: Decodable {
//    struct Foo: Decodable {
//        let foo: String
//    }
//    let args: Foo?
//}
//
//let dataTaskPublisher = URLSession.shared
//    .dataTaskPublisher(
//        for: URL(string: "https://httpbin.org/get?foo=bar")!)
//    .share()
//
//let isSuccess = dataTaskPublisher
//    .map { data, response -> Bool in
//        guard let httpRes = response as? HTTPURLResponse else {
//            return false
//        }
//        return httpRes.statusCode == 200
//    }
//    .replaceError(with: false)
//
//let latestText = dataTaskPublisher
//    .map { data, _ in data }
//    .decode(type: Response.self, decoder: JSONDecoder())
//    .compactMap { $0.args?.foo }
//    .replaceError(with: "")
//
//let ui = LoadingUI()
//var token1 = isSuccess.assign(to: \.isSuccess, on: ui)
//var token2 = latestText.assign(to: \.text, on: ui)


struct Response: Decodable {
    struct Foo: Decodable {
        let foo: String
    }
    let args: Foo?
}
let searchText = PassthroughSubject<String, Never>()
check("Debounce") {
    searchText
        
    // ... 在这里添加防抖，变形和网络等操作
}
delay(0.1) { searchText.send("I") }
delay(0.2) { searchText.send("Love") }
delay(0.5) { searchText.send("SwiftUI") }
delay(1.6) { searchText.send("And") }
delay(2.0) { searchText.send("Combine") }
