//
//  AuthErrorAlertIOS.swift
//  Automa
//
//  Created by Simon Ferns on 2024/05/06.
//

import Foundation
import SwiftUI

func AuthErrorAlertIOS(alertMessage: String) -> Alert {
    Alert(
        title: Text(alertMessage),
        dismissButton: .default(Text("OK"))
    )
}
