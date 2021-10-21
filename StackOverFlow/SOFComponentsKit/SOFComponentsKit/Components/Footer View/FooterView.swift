//
//  FooterView.swift
//  SOFComponentsKit
//
//  Created by Preshen Naidoo on 2021/10/21.
//

import Foundation
import UIKit

public struct FooterContentModel {
    var image = UIImage()
    var title = ""
    var description = ""
    var subDescription = ""
    
    public init(image: UIImage,
                title: String,
                description: String,
                subDescription: String) {
        self.image = image
        self.title = title
        self.description = description
        self.subDescription = subDescription
    }
}

@IBDesignable
public final class FooterView: UIView {
    
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var descriptionLabel: UILabel!
    @IBOutlet private var subDescriptionLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupNib()
    }
    
    @IBInspectable public var image: UIImage? {
        didSet {
            self.imageView.image = image
        }
    }
    
    public func populate(with content: FooterContentModel) {
        self.imageView.image = content.image
        self.titleLabel.text = content.title
        self.descriptionLabel.text = content.description
        self.subDescriptionLabel.text = content.subDescription
    }
}
