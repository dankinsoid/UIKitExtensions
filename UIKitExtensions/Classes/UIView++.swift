//
//  UIView++.swift
//  UIKitExtensions
//
//  Created by Daniil on 10.08.2019.
//

import UIKit

extension UIView {
    
    public func allSubviews() -> [UIView] {
        var result = subviews
        for subview in subviews {
            result += subview.allSubviews()
        }
        return result
    }
    
    public func allSubviews<T: UIView>(of type: T.Type) -> [T] {
        return allSubviews().compactMap({ $0 as? T })
    }
    
    public func setEdgesToSuperview(leading: CGFloat? = 0, trailing: CGFloat? = 0, top: CGFloat? = 0, bottom: CGFloat? = 0) {
        guard let sv = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        if let l = leading {
            NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: sv, attribute: .leading, multiplier: 1, constant: l).isActive = true
        }
        if let t = trailing {
            NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: sv, attribute: .trailing, multiplier: 1, constant: t).isActive = true
        }
        if let t = top {
            NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: sv, attribute: .top, multiplier: 1, constant: t).isActive = true
        }
        if let b = bottom {
            NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: sv, attribute: .bottom, multiplier: 1, constant: b).isActive = true
        }
    }
}
