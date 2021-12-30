//
//  Font+Ext.swift
//  SuperHero-Divar
//
//  Created by Fateme on 10/9/1400 AP.
//

import UIKit

extension UIFont {

    enum FontType: String {
        case interRegular              = "Inter-Regular"
        case interBold                 = "Inter-Bold"
        case interBlack                = "Inter-Black"
        case interMedium               = "Inter-Medium"
        case interSemiBold             = "Inter-SemiBold"
        
        case montserratRegular         = "Montserrat-Regular"
        case montserratBlack           = "Montserrat-Black"
        case montserratLight           = "Montserrat-Light"
        case montserratBold            = "Montserrat-Bold"
        case montserratMedium          = "Montserrat-Medium"
        case montserratSemiBold        = "Montserrat-SemiBold"
        
        case sfProTextSemibold         = "SFProText-Semibold"
        
        case creditCardRegular          = "Credit-Card-Regular"
    }
    
    convenience init?(type: FontType, fontSize: CGFloat = 15.0) {
        self.init(name: type.rawValue, size: fontSize)
    }
    
    static func availableSpecificFonts() {
        availableFonts(familyNames: ["Inter", "Montserrat", "SF Pro Text", "Credit Card"])
    }
    
    static func availableFonts(familyNames: [String]? = nil) {
        let validFamilyNames: [String] = familyNames ?? UIFont.familyNames
        #if DEBUG
        print("---------------Fonts---------------")
        for family in validFamilyNames {
            print("\(family)")
            // Show all fonts for any given family
            for name in UIFont.fontNames(forFamilyName: family) {
                print("   \(name)")
            }
        }
        print("-----------------------------------")
        #endif
    }
}
