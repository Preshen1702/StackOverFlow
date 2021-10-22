//
//  BaseView.swift
//  SOFComponentsKit
//
//  Created by Preshen Naidoo on 2021/10/22.
//

import Foundation
import UIKit

public class BaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupNib()
    }
}
