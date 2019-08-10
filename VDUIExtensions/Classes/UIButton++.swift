//
//  UIButton++.swift
//  Pods-UIKitExtensions_Tests
//
//  Created by Daniil on 10.08.2019.
//

import UIKit
import ObjectiveC

public extension UIButton {
    
    fileprivate struct AssociatedKey {
        static var stateColors = "stateColors"
        static var stateColorsObservers = "stateColorsObservers"
    }
    
    fileprivate var colors: [UInt: UIColor] {
        get {
            return (objc_getAssociatedObject(self, &AssociatedKey.stateColors) as? [UInt: UIColor]) ?? [:]
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKey.stateColors, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    fileprivate var stateObservers: [NSKeyValueObservation] {
        get {
            return (objc_getAssociatedObject(self, &AssociatedKey.stateColorsObservers) as? [NSKeyValueObservation]) ?? []
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKey.stateColorsObservers, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    func setBackground(color: UIColor, for state: UIControl.State) {
        var stateColor = self.colors
        stateColor[state.rawValue] = color
        if state == self.state {
            DispatchQueue.main.async { self.backgroundColor = color }
        } else {
            stateColor[self.state.rawValue] = stateColor[self.state.rawValue] ?? backgroundColor ?? .clear
        }
        if stateObservers.isEmpty {
            var observers: [NSKeyValueObservation] = []
            observers.append(self.observe(\.isEnabled) { (button, _) in button.setColor() })
            observers.append(self.observe(\.isHighlighted) { (button, _) in button.setColor() })
            observers.append(self.observe(\.isFocused) { (button, _) in button.setColor() })
            observers.append(self.observe(\.isSelected) { (button, _) in button.setColor() })
            observers.append(self.observe(\.state) { (button, _) in button.setColor() })
            stateObservers = observers
        }
        self.colors = stateColor
    }
    
    fileprivate func setColor() {
        UIView.animate(withDuration: 0.2, animations: {
            self.backgroundColor = self.colors[self.state.rawValue] ?? self.backgroundColor
        })
    }
    
}
