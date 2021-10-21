//
//  HeadingView.swift
//  SOFComponentsKit
//
//  Created by Preshen Naidoo on 2021/10/21.
//

import Foundation
import UIKit

@IBDesignable
public final class HeadingView: UIView {
    
    @IBOutlet private var headingLabelView: UILabel!
    
    @IBInspectable public var headingLabelText: String? {
        didSet {
            self.headingLabelView.text = headingLabelText
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupNib()
    }
    
}
