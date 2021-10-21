//
//  TagsView.swift
//  SOFComponentsKit
//
//  Created by Preshen Naidoo on 2021/10/21.
//

import Foundation
import UIKit

@IBDesignable
public final class TagsView: UIView {
    
    @IBOutlet private var tagsLabelView: UILabel!
    
    @IBInspectable public var tagsLabelText: String? {
        didSet {
            self.tagsLabelView.text = tagsLabelText
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
