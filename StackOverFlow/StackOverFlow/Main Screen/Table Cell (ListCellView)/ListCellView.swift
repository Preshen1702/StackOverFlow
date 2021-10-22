//
//  ListCellView.swift
//  StackOverFlow
//
//  Created by Preshen Naidoo on 2021/10/20.
//

import Foundation
import UIKit
import SOFComponentsKit

class ListCellView: UITableViewCell {
    
    @IBOutlet private var listInputView: ListView!
    
    func populate(with content: ListContentModel) {
        listInputView.populate(with: content)
    }
}
