//
//  ListView.swift
//  SOFComponentsKit
//
//  Created by Preshen Naidoo on 2021/10/20.
//

import Foundation
import UIKit

public struct ListContentModel {
    var titleLabel = ""
    var votesLabel = ""
    var answersLabel = ""
    var viewsLabel = ""
    var askedByLabel = ""
    
    public init(titleLabel: String,
                votesLabel: String,
                answersLabel: String,
                viewsLabel: String,
                askedByLabel: String) {
        self.titleLabel = titleLabel
        self.votesLabel = votesLabel
        self.answersLabel = answersLabel
        self.viewsLabel = viewsLabel
        self.askedByLabel = askedByLabel
    }
}

@IBDesignable
public final class ListView: UIView {
    
    @IBOutlet private var titleLabelView: UILabel!
    @IBOutlet private var votesLabel: UILabel!
    @IBOutlet private var answersLabel: UILabel!
    @IBOutlet private var viewsLabel: UILabel!
    @IBOutlet private var contentView: UIView!
    @IBOutlet private var askedByLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupNib()
    }
    
    @IBInspectable public var titleLabelText: String? {
        didSet {
            self.titleLabelView.text = titleLabelText
        }
    }
    
    public func populate(with content: ListContentModel) {
        self.titleLabelView.text = content.titleLabel
        self.votesLabel.text = content.votesLabel
        self.answersLabel.text = content.answersLabel
        self.viewsLabel.text = content.viewsLabel
        self.askedByLabel.text = content.askedByLabel
    }
}

public extension UIView {
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
