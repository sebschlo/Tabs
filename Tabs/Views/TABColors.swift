//
//  TABColors.swift
//  Tabs
//
//  Created by Schloesser, Sebastian on 7/20/15.
//  Copyright © 2015 Schloesser, Sebastian. All rights reserved.
//

import UIKit

public extension UIColor {

    private class func rgba(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: a)
    }

    class func tab_grayColor () -> UIColor {
        return rgba(77, g: 91, b: 95, a: 1)
    }

    class func tab_orangeColor () -> UIColor {
        return rgba(252, g: 117, b: 81, a:1)
    }

    class func tab_yellowColor () -> UIColor {
        return rgba(250, g: 203, b: 64, a: 1)
    }

    class func tab_lightGrayColor () -> UIColor {
        return rgba(215, g: 223, b: 231, a: 1)
    }

    class func tab_lightPinkColor () -> UIColor {
        return rgba(202, g: 176, b: 190, a: 1)
    }
}
