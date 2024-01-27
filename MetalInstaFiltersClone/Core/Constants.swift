//
//  Constants.swift
//  MetalInstaFiltersCLone
//
//  Created by User on 27.1.2024.
//

import Foundation

enum Spacing: CGFloat {
    case small = 8
    case medium = 12
    case large = 16
}

enum Size: CGFloat {
    case large = 64
}

enum Radii: CGFloat {
    case xSmall = 2
}

extension CGFloat {
    static func spacing(_ spacing: Spacing) -> CGFloat {
        return spacing.rawValue
    }
    
    static func size(_ size: Size) -> CGFloat {
        return size.rawValue
    }
    
    static func radius( _ radii: Radii) -> CGFloat {
        return radii.rawValue
    }
}
