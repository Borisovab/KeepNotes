//
//  UIFont+ex.swift
//  KeepNotes
//
//  Created by Александр Борисов on 01.03.2023.
//

import UIKit

extension UIFont {

    func withTraits(_ traits:UIFontDescriptor.SymbolicTraits...) -> UIFont {
        let name = Singleton.shared.strStyleName

        let strDescriptor = self.fontDescriptor
            .withSymbolicTraits(UIFontDescriptor.SymbolicTraits(traits).union(self.fontDescriptor.symbolicTraits))?.postscriptName

        if strDescriptor != nil {
//            print("strDescriptor from UIFont Bold ========> \(strDescriptor)")
            Singleton.shared.strStyleName = strDescriptor!
            return UIFont(name: strDescriptor!, size: 14)!

        } else {
//            print("strDescriptor from UIFont if Bold not successed ========> \(strDescriptor)")
            return UIFont(name: name, size: 14)!
        }
    }


    func withoutTraits(_ traits:UIFontDescriptor.SymbolicTraits...) -> UIFont {
        let strDescriptor = self.fontDescriptor
            .withSymbolicTraits(self.fontDescriptor.symbolicTraits.subtracting(UIFontDescriptor.SymbolicTraits(traits)))?.postscriptName
//        print("strDescriptor from UIFont noBold ========> \(strDescriptor)")
        return UIFont(name: strDescriptor!, size: 0)!
//        return UIFont(descriptor: descriptor!, size: 14)
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
