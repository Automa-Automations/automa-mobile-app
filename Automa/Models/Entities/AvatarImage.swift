//
//  AvatarImage.swift
//  Automa
//
//  Created by Simon Ferns on 2024/05/13.
//

import Foundation
import SwiftUI

struct AvatarImage: Transferable, Equatable {
    let image: Image
    let data: Data

    static var transferRepresentation: some TransferRepresentation {
        DataRepresentation(importedContentType: .image) { data in
            guard let image = AvatarImage(data: data) else {
                throw TransferError.importFailed
            }

            return image
        }
    }
}
