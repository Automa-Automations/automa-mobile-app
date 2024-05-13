//
//  GenericTitle.swift
//  Automa
//
//  Created by Simon Ferns on 2024/05/07.
//

import Foundation
import SwiftUI

struct GenericTitle: View {
    let title: String
    let description: String
    var body: some View {
        Text(title)
            .font(.custom("Inter", size: 42))
            .fontWeight(.thin)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 26.0)
            .foregroundColor(Color("Primary"))

        Text(description)
            .font(.custom("Inter", size: 32))
            .fontWeight(.thin)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 25.0)
            .foregroundColor(Color("TextPrimary"))
    }
}
