//
//  Notifications.swift
//  Automa
//
//  Created by Simon Ferns on 2024/06/17.
//
import SwiftUI

struct Notifications_: View {
    var body: some View {
        VStack(spacing: 30) {
            GenericTitle(title: "Notifications", description: nil, padding: nil)
            GroupBox {
                Toggle("Should we send notifications?", isOn: .constant(false))
            }.padding(.horizontal, 20)

            VStack {
                GenericTitle(title: nil, description: "Notifications", padding: nil)
                ScrollView(showsIndicators: false) {
                    ForEach(0 ... 10, id: \.self) { _ in
                        GroupBox {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("※ Image Generation")
                                        .font(.caption)
                                        .foregroundStyle(Color(hex: 0x8E8E93))
                                    Text("😳 Bots are using 70% more credits than usual.").font(.footnote)
                                }
                                Spacer()
                            }
                        }
                    }
                }.padding(.horizontal, 20)
            }
            Spacer()
        }
    }
}
