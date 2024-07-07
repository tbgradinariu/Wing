//
//  Fonts.swift
//  iosApp
//
//  Created by Tiberiu Gradinariu on 2024-06-15.
//  Copyright © 2024 orgName. All rights reserved.
//

import SwiftUI

enum FontWeight {
    case black
    case bold
    case heavy
    case medium
    case regular
    case semibold
    case thin
    case light
    case ultralight
}

extension Font {
    static let sanFranciscoPro: (FontWeight, CGFloat) -> Font = { fontType, size in
        switch fontType {
            
        case .black:
            Font.custom("SFProDisplay-Black", size: size)
        case .bold:
            Font.custom("SFProDisplay-Bold", size: size)
        case .heavy:
            Font.custom("SFProDisplay-Heavy", size: size)
        case .medium:
            Font.custom("SFProDisplay-Medium", size: size)
        case .regular:
            Font.custom("SFProDisplay-Regular", size: size)
        case .semibold:
            Font.custom("SFProDisplay-Semibold", size: size)
        case .thin:
            Font.custom("SFProDisplay-Thin", size: size)
        case .light:
            Font.custom("SFProDisplay-Light", size: size)
        case .ultralight:
            Font.custom("SFProDisplay-Ultralight", size: size)
        }
    }
}

extension Text {
    func sanFranciscoProFont(_ fontWeight: FontWeight = .regular, _ size: CGFloat = 16) -> Text {
        return self.font(.sanFranciscoPro(fontWeight, size))
    }
}
