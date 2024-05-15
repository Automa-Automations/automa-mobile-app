//
//  AvatarImageExtension.swift
//  Automa
//
//  Created by Simon Ferns on 2024/05/13.
//

import Foundation
import SwiftUI

extension AvatarImage {
    init?(data: Data) {
        guard let uiImage = UIImage(data: data) else {
            return nil
        }

        let image = Image(uiImage: uiImage)
        self.init(image: image, data: data)
    }
}
