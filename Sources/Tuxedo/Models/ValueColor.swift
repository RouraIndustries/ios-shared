//
//  ValueColor.swift
//  
//
//  Created by Christopher J. Roura on 2/7/24.
//

import UIKit

public enum ValueColor: CaseIterable {
    case blue1
    case blue2
    case blue3
    case blue4
    case blue5
    case blue6
    case blue7
    case blue8

    case green1
    case green2
    case green3
    case green4
    case green5
    case green6
    case green7
    case green8

    case yellow1
    case yellow2
    case yellow3
    case yellow4
    case yellow5
    case yellow6
    case yellow7
    case yellow8

    case orange1
    case orange2
    case orange3
    case orange4
    case orange5
    case orange6
    case orange7
    case orange8

    case red1
    case red2
    case red3
    case red4
    case red5
    case red6
    case red7
    case red8

    case grey1
    case grey2
    case grey3
    case grey4
    case grey5
    case grey6
    case grey7
    case grey8

    case black0
    case black1
    case black2
    case black3
    case black4
    case black5
    case black6
    case black7
    case black8

    case white
    case black
}

// MARK: - Descriptors

public extension ValueColor {
    var name: String {
        String(describing: self)
    }

    var description: String {
        components.description
    }
}

// MARK: - Components

internal extension ValueColor {
    enum Components {
        case rgb(_ r: UIColorComponent, _ g: UIColorComponent, _ b: UIColorComponent)
        case rgba(_ r: UIColorComponent, _ g: UIColorComponent, _ b: UIColorComponent, _ a: UIColorAlphaComponent)
        case w(_ w: UIColorComponent)
        case wa(_ w: UIColorComponent, _ a: UIColorAlphaComponent)

        func opacity(_ a: UIColorAlphaComponent) -> Self {
            switch self {
            case .rgb(let r, let g, let b):
                return a == 1.0 ? self : .rgba(r, g, b, a)
            
            case .rgba(let r, let g, let b, _):
                return a == 1.0 ? .rgb(r, g, b) : .rgba(r, g, b, a)
            
            case .w(let w):
                return a == 1.0 ? self : .wa(w, a)
            
            case .wa(let w, _):
                return a == 1.0 ? .w(w) : .wa(w, a)
            }
        }

        var uiColor: UIColor {
            switch self {
            case .rgb(let r, let g, let b):
                return UIColor.rgb(r, g, b)
            
            case .rgba(let r, let g, let b, let a):
                return UIColor.rgb(r, g, b, a)
            
            case .w(let w):
                return UIColor.w(w)
            
            case .wa(let w, let a):
                return UIColor.w(w, a)
            }
        }

        var description: String {
            switch self {
            case .rgb(let r, let g, let b):
                return String(format: "rgb(%i, %i, %i)", r, g, b)
            
            case .rgba(let r, let g, let b, let a):
                return String(format: "rgba(%i, %i, %i, %.2f)", r, g, b, a.rawValue)
            
            case .w(let w):
                return String(format: "w(%i)", w)
            
            case .wa(let w, let a):
                return String(format: "wa(%i, %.2f)", w, a.rawValue)
            }
        }
    }
}

// MARK: - Definitions

internal extension ValueColor {
    var components: Components {
        switch self {
        case .blue1:    return .rgb(14, 110, 180)
        case .blue2:    return .rgb(0, 153, 229)
        case .blue3:    return .rgb(73, 179, 230)
        case .blue4:    return .rgb(130, 197, 236)
        case .blue5:    return .rgb(175, 216, 242)
        case .blue6:    return .rgb(215, 235, 248)
        case .blue7:    return .rgb(234, 244, 251)
        case .blue8:    return .rgb(239, 248, 255)

        case .green1:   return .rgb(72, 168, 42)
        case .green2:   return .rgb(106, 191, 79)
        case .green3:   return .rgb(145, 211, 123)
        case .green4:   return .rgb(178, 225, 161)
        case .green5:   return .rgb(201, 234, 188)
        case .green6:   return .rgb(215, 240, 204)
        case .green7:   return .rgb(222, 242, 212)
        case .green8:   return .rgb(227, 247, 217)

        case .yellow1:  return .rgb(255, 213, 0)
        case .yellow2:  return .rgb(254, 217, 33)
        case .yellow3:  return .rgb(254, 227, 96)
        case .yellow4:  return .rgb(253, 235, 146)
        case .yellow5:  return .rgb(253, 240, 177)
        case .yellow6:  return .rgb(253, 243, 196)
        case .yellow7:  return .rgb(252, 245, 205)
        case .yellow8:  return .rgb(254, 248, 217)

        case .orange1:  return .rgb(245, 111, 16)
        case .orange2:  return .rgb(248, 141, 61)
        case .orange3:  return .rgb(251, 171, 109)
        case .orange4:  return .rgb(253, 194, 147)
        case .orange5:  return .rgb(254, 208, 172)
        case .orange6:  return .rgb(255, 217, 186)
        case .orange7:  return .rgb(255, 221, 194)
        case .orange8:  return .rgb(255, 228, 206)

        case .red1: return .rgb(214, 14, 0)
        case .red2: return .rgb(227, 43, 30)
        case .red3: return .rgb(238, 98, 88)
        case .red4: return .rgb(246, 144, 136)
        case .red5: return .rgb(251, 175, 169)
        case .red6: return .rgb(254, 193, 189)
        case .red7: return .rgb(255, 203, 199)
        case .red8: return .rgb(255, 213, 209)

        case .grey1:    return .rgb(91, 102, 112)
        case .grey2:    return .rgb(151, 163, 174)
        case .grey3:    return .rgb(171, 181, 189)
        case .grey4:    return .rgb(191, 199, 205)
        case .grey5:    return .rgb(212, 217, 221)
        case .grey6:    return .rgb(233, 235, 237)
        case .grey7:    return .rgb(243, 244, 245)
        case .grey8:    return .rgb(245, 246, 250)

        case .black0:   return .rgb(11, 13, 15)
        case .black1:   return .rgb(23, 27, 31)
        case .black2:   return .rgb(25, 29, 34)
        case .black3:   return .rgb(30, 35, 40)
        case .black4:   return .rgb(38, 44, 51)
        case .black5:   return .rgb(50, 59, 68)
        case .black6:   return .rgb(66, 77, 89)
        case .black7:   return .rgb(81, 95, 110)
        case .black8:   return .rgb(93, 106, 121)

        case .white:    return .w(255)
        case .black:    return .w(0)
        }
    }
}
