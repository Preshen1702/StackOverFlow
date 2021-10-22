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
public final class FooterView: BaseView {
    
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var descriptionLabel: UILabel!
    @IBOutlet private var subDescriptionLabel: UILabel!
    @IBOutlet private var loadingIndicator: UIActivityIndicatorView!
    
    @IBInspectable public var image: UIImage? {
        didSet {
            self.loadingIndicator.stopAnimating()
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
