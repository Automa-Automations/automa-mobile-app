//
//  PaymentError.swift
//  Automa
//
//  Created by Simon Ferns on 2024/05/21.
//
import Foundation
import SwiftUI

func PaymentError(alertMessage: String) -> Alert {
    Alert(
        title: Text(alertMessage),
        dismissButton: .default(Text("OK"))
    )
}

