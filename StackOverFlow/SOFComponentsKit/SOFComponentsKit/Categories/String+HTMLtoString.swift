//
//  String+HTMLtoString.swift
//  SOFComponentsKit
//
//  Created by Preshen Naidoo on 2021/10/21.
//

import Foundation

public extension String {
    
    func getHtmlFormat() -> String? {
        guard let htmlData = self.data(using: String.Encoding.unicode) else { return nil }
        return try? NSAttributedString(data: htmlData, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil).string
    }
}
