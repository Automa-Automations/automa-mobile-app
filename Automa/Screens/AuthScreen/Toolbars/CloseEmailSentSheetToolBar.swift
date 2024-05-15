import SwiftUI

struct CloseEmailSentSheetToolBar: ToolbarContent {
    @Binding var showPopover: Bool

    var body: some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            Button(action: {
                showPopover = false
            }) {
                HStack {
                    Image(systemName: "chevron.left")
                    Text("Close")
                }.accentColor(.brown)
            }
        }
    }
}
