//
//  AutomaApp.swift
//  Automa
//
//  Created by Simon Ferns on 2024/04/23.
//

import SwiftUI
import StripeCore

@main
struct AutomaApp: App {
    var body: some Scene {
        WindowGroup {
            AppView()
                .onOpenURL { incomingURL in
                          let stripeHandled = StripeAPI.handleURLCallback(with: incomingURL)
                          if (!stripeHandled) {
                            // This was not a Stripe url – handle the URL normally as you would
                          }
                        }
        }
    }
}
