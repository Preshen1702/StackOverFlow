//
//  UIView+NibView.swift
//  SOFComponentsKit
//
//  Created by Preshen Naidoo on 2021/10/22.
//

import Foundation
import UIKit

extension UIView {
    func setupNib() {
        let className = String(describing: type(of: self))
        let nib = UINib(nibName: className, bundle: Bundle(for: type(of: self)))
        let nibView = nib.instantiate(withOwner: self, options: nil).first as? UIView
        nibView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(nibView ?? UIView())
        nibView?.frame = self.bounds
        self.backgroundColor = .clear
    }
}
