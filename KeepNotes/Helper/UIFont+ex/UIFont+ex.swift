//
//  UIFont+ex.swift
//  KeepNotes
//
//  Created by Александр Борисов on 01.03.2023.
//

import UIKit

extension UIFont {

    func withTraits(_ traits:UIFontDescriptor.SymbolicTraits...) -> UIFont {
        let descriptor = self.fontDescriptor
            .withSymbolicTraits(UIFontDescriptor.SymbolicTraits(traits).union(self.fontDescriptor.symbolicTraits))

        if descriptor != nil {
            return UIFont(descriptor: descriptor!, size: 0)
        } else {
            return noBold()
        }
    }


    func withoutTraits(_ traits:UIFontDescriptor.SymbolicTraits...) -> UIFont {
        let descriptor = self.fontDescriptor
            .withSymbolicTraits(self.fontDescriptor.symbolicTraits.subtracting(UIFontDescriptor.SymbolicTraits(traits)))

        return UIFont(descriptor: descriptor!, size: 0)
    }



    func bold() -> UIFont {
        return withTraits( .traitBold)
    }

    func italic() -> UIFont {
        return withTraits(.traitItalic)
    }

    func noItalic() -> UIFont {
        return withoutTraits(.traitItalic)
    }
    func noBold() -> UIFont {
        return withoutTraits(.traitBold)
    }
}
