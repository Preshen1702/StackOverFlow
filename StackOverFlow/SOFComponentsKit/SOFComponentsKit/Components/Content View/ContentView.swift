//
//  ContentView.swift
//  SOFComponentsKit
//
//  Created by Preshen Naidoo on 2021/10/21.
//

import Foundation
import UIKit

@IBDesignable
public final class ContentView: BaseView {
    
    @IBOutlet private var contentLabelView: UILabel!
    
    @IBInspectable public var contentLabelText: String? {
        didSet {
            self.contentLabelView.text = contentLabelText
        }
    }
}
