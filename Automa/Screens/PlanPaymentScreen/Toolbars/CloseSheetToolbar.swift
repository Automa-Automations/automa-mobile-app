//
//  SignOutToolbar.swift
//  Automa
//
//  Created by Simon Ferns on 2024/05/07.
//

import Foundation
import SwiftUI

struct CloseSheetToolbar: ToolbarContent {
    @Binding var sheetOpen: Bool
    var body: some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            Button(action: {
                sheetOpen = false
            }) {
                HStack {
                    Image(systemName: "chevron.left").foregroundColor(.brown)
                    Text("Close").foregroundStyle(.brown)
                }
            }
        }
    }
}
