import SwiftUI

struct ListView: View {
    @State private var content = [Int](0..<10) {
        didSet {
            print(content)
        }
    }

    var body: some View {
        NavigationView {
            List(content, id: \.self) { element in
                NavigationLink(
                    destination: DetailView(
                        remove: {
                            self.content.removeAll { $0 == element }
                        }
                    )
                ) {
                    Text("Element #\(element)")
                }
            }
        }
    }
}

struct DetailView: View {

    let remove: () -> Void

    init(remove: @escaping () -> Void) {
        self.remove = remove
    }

    var body: some View {
        VStack {
            Text("Hello world!")

            Button(
                action: {
                    self.remove()
                }
            ) {
                Image(systemName: "trash.circle")
                    .imageScale(.large)
            }
        }
    }
}
