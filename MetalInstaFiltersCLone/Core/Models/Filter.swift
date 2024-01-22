//
//  Filters.swift
//  MetalInstaFiltersCLone
//
//  Created by User on 22.1.2024.
//

import Foundation

enum Filter: CaseIterable {
    case amaro
    case earlyBird
    case hefe
    case hudson
    case mayfair
    case rise
    case toaster
    case valencia
    case willow
    case xPro
    
    /// Display title
    var title: String {
        switch self {
        case .amaro: return "Amaro"
        case .earlyBird: return "Early bird"
        case .hefe: return "Hefe"
        case .hudson: return "Hudson"
        case .mayfair: return "Mayfair"
        case .rise: return "Rise"
        case .toaster: return "Toaster"
        case .valencia: return "Valencia"
        case .willow: return "Willow"
        case .xPro: return "Xpro"
        }
    }
}
