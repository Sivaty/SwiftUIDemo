import SwiftUI

extension VerticalAlignment {
    struct SelectAlignment: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[VerticalAlignment.center]
        }
    }

    static let select = VerticalAlignment(SelectAlignment.self)
}

struct SelectAlignmentView: View {

    @State var selectedIndex = 1

    let names = [
        "onevcat | Wei Wang",
        "zaq | Hao Zang",
        "tyyqa | Lixiao Yang"
    ]

    var body: some View {
        HStack {
            Image(systemName: "person.circle")
            Text("User:")
            Text("onevcat | Wei Wang")
        }
        .lineLimit(1)
        .frame(width: 200)
    }
}

struct SelectAlignmentView_Previews: PreviewProvider {
    static var previews: some View {
        SelectAlignmentView()
    }
}
