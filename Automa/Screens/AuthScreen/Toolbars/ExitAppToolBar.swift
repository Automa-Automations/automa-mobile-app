import SwiftUI

struct ExitAppToolBar: ToolbarContent {
    var body: some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            Button(action: {
                UIApplication.shared.perform(#selector(NSXPCConnection.suspend))
            }) {
                HStack {
                    Image(systemName: "chevron.left")
                    Text("Exit")
                }.accentColor(.brown)
            }
        }
    }
}
