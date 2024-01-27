//
//  Filters.swift
//  MetalInstaFiltersCLone
//
//  Created by User on 22.1.2024.
//

import Foundation
import MetalKit
import SwiftUI

public enum Filter: CaseIterable, Hashable {
    
    case amaro
    case earlyBird
    case hefe
    case hudson
    case mayfair
    case rise
    case toaster
    case willow
    case xPro
    case none
    case valenciaGlow
    case hudsonHaze
    case moonlightMirage
    case goldenRadiance
    case lushAmber
    case celestialCascade
    case sapphireDream
    case vintageEssence
    case mochaWhisper
    case electricElegance
    case aquaHarmony
    case sunsetSerenade
    case mysticBloom
    case enchantedEcho
    case velvetMirage
    case obsidianTwilight
    case coralKiss
    case midnightEmber
    case whisperingWillow
    case gildedGaze
    case subtleSpark
    
    public static var allCases: [Filter] {
        return [
            .none,
            .amaro,
            .earlyBird,
            .hefe,
            .hudson,
            .mayfair,
            .rise,
            .toaster,
            .willow,
            .xPro,
            .valenciaGlow,
            .hudsonHaze,
            .moonlightMirage,
            .goldenRadiance,
            .lushAmber,
            .celestialCascade,
            .sapphireDream,
            .vintageEssence,
            .mochaWhisper,
            .electricElegance,
            .aquaHarmony,
            .sunsetSerenade,
            .mysticBloom,
            .enchantedEcho,
            .velvetMirage,
            .obsidianTwilight,
            .coralKiss,
            .midnightEmber,
            .whisperingWillow,
            .gildedGaze,
            .subtleSpark
        ]
    }
    
    /// Display title
    public var title: String {
        switch self {
        case .amaro: return "Amaro"
        case .earlyBird: return "Early bird"
        case .hefe: return "Hefe"
        case .hudson: return "Hudson"
        case .mayfair: return "Mayfair"
        case .rise: return "Rise"
        case .toaster: return "Toaster"
        case .willow: return "Willow"
        case .xPro: return "Xpro"
        case .none: return "none"
        case .valenciaGlow: return "Valencia Glow"
        case .hudsonHaze: return "Hudson Haze"
        case .moonlightMirage: return "Moonlight Mirage"
        case .goldenRadiance: return "Golden Radiance"
        case .lushAmber: return "Lush Amber"
        case .celestialCascade: return "Celestial Cascade"
        case .sapphireDream: return "Sapphire Dream"
        case .vintageEssence: return "Vintage Essence"
        case .mochaWhisper: return "Mocha Whisper"
        case .electricElegance: return " Electric Elegance"
        case .aquaHarmony: return "Aqua Harmony"
        case .sunsetSerenade: return "Sunset Serenade"
        case .mysticBloom: return "Mystic Bloom"
        case .enchantedEcho: return "Enchanted Echo"
        case .velvetMirage: return "Velvet Mirage"
        case .obsidianTwilight: return "Obsidian Twilight"
        case .coralKiss: return "Coral Kiss"
        case .midnightEmber: return "Midnight Ember"
        case .whisperingWillow: return "Whispering Willow"
        case .gildedGaze: return " Gilded Gaze"
        case .subtleSpark: return "Subtle Spark"
        }
    }
}

// MARK: Metal values
public extension Filter {
    
    /// Fragment shader name used to load shader in `Renderer`
    var fragment: String {
        switch self {
        case .amaro:
            "amaro_kernel_main"
        case .earlyBird:
            "early_bird_kernel_main"
        case .hefe:
            "hefe_kernel_main"
        case .hudson:
            "hudson_kernel_main"
        case .mayfair:
            "mayfair_kernel_main"
        case .rise:
            "rise_kernel_main"
        case .toaster:
            "toaster_kernel_main"
        case .willow:
            "willow_kernel_main"
        case .xPro:
            "xpro_kernel_main"
        case .none:
            "original_kernel_main"
        default: ""
        }
    }
    
    var texture: UIImage? {
        switch self {
            
        case .amaro,
                .earlyBird,
                .mayfair,
                .rise,
                .willow,
                .xPro:
            return  Assets.Shaders.Overlays.filter2.image
        case .hefe:
            return Assets.Shaders.Overlays.hefe.image
        case .hudson:
            return Assets.Shaders.Overlays.hudson.image
        case .toaster:
            return Assets.Shaders.Overlays.toaster.image
        default:
            return nil
        }
    }
    
    var lut: UIImage? {
        switch self {
        case .valenciaGlow:
            return Assets.Shaders.LUTs.a.image
        case .hudsonHaze:
            return Assets.Shaders.LUTs.b.image
        case .moonlightMirage:
            return Assets.Shaders.LUTs.c.image
        case .goldenRadiance:
            return Assets.Shaders.LUTs.d.image
        case .lushAmber:
            return Assets.Shaders.LUTs.e.image
        case .celestialCascade:
            return Assets.Shaders.LUTs.f.image
        case .sapphireDream:
            return Assets.Shaders.LUTs.g.image
        case .vintageEssence:
            return Assets.Shaders.LUTs.h.image
        case .mochaWhisper:
            return Assets.Shaders.LUTs.i.image
        case .electricElegance:
            return Assets.Shaders.LUTs.j.image
        case .aquaHarmony:
            return Assets.Shaders.LUTs.k.image
        case .sunsetSerenade:
            return Assets.Shaders.LUTs.l.image
        case .mysticBloom:
            return Assets.Shaders.LUTs.m.image
        case .enchantedEcho:
            return Assets.Shaders.LUTs.n.image
        case .velvetMirage:
            return Assets.Shaders.LUTs.o.image
        case .obsidianTwilight:
            return Assets.Shaders.LUTs.p.image
        case .coralKiss:
            return Assets.Shaders.LUTs.q.image
        case .midnightEmber:
            return Assets.Shaders.LUTs.r.image
        case .whisperingWillow:
            return Assets.Shaders.LUTs.s.image
        case .gildedGaze:
            return Assets.Shaders.LUTs.t.image
        case .subtleSpark:
            return Assets.Shaders.LUTs.u.image
        default: return nil
        }
    }
}
