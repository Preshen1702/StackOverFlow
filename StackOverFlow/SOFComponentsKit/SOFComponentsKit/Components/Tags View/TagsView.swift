//
//  TagsView.swift
//  SOFComponentsKit
//
//  Created by Preshen Naidoo on 2021/10/21.
//

import Foundation
import UIKit

@IBDesignable
public final class TagsView: BaseView {
    
    @IBOutlet private var tagsLabelView: UILabel!
    
    @IBInspectable public var tagsLabelText: String? {
        didSet {
            self.tagsLabelView.text = tagsLabelText
        }
    }
}
