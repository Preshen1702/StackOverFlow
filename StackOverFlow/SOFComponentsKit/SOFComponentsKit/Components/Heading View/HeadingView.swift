//
//  HeadingView.swift
//  SOFComponentsKit
//
//  Created by Preshen Naidoo on 2021/10/21.
//

import Foundation
import UIKit

@IBDesignable
public final class HeadingView: BaseView {
    
    @IBOutlet private var headingLabelView: UILabel!
    
    @IBInspectable public var headingLabelText: String? {
        didSet {
            self.headingLabelView.text = headingLabelText
        }
    }
}
