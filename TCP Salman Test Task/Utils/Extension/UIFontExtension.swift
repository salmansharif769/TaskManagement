//
//  UIFontExtension.swift
//  TCP Salman Test Task
//
//  Created by Salman Sharif on 08/06/2024.
//

import UIKit
extension UIFont {
    enum AmsiPro {
        case regular(size: CGFloat)
        case bold(size: CGFloat)
        var font: UIFont! {
            switch self {
            case .regular(let size):
                return UIFont(name: "AmsiPro-Regular", size: size) ?? UIFont.systemFont(ofSize: size)
            case .bold(let size):
                return UIFont(name: "AmsiPro-Bold", size: size) ?? UIFont.boldSystemFont(ofSize: size)
            }
        }
    }
}
