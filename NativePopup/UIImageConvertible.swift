//
//  UIImageConvertible.swift
//  NativePopup
//
//  Created by mono on 2017/04/23.
//  Copyright © 2017 mono. All rights reserved.
//

import Foundation
import UIKit

public enum Image {
    case image(UIImage)
    case emoji(Character)
}

public protocol ImageConvertible {
    var image: Image { get }
}

extension UIImage: ImageConvertible {
    public var image: Image { return .image(self) }
}
