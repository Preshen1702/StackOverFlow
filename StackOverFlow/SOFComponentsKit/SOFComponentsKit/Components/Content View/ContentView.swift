//
//  ContentView.swift
//  SOFComponentsKit
//
//  Created by Preshen Naidoo on 2021/10/21.
//

import Foundation
import UIKit

@IBDesignable
public final class ContentView: UIView {
    
    @IBOutlet private var contentLabelView: UILabel!
    
    @IBInspectable public var contentLabelText: String? {
        didSet {
            self.contentLabelView.text = contentLabelText
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
