//
//  Date+ConvertDateToString.swift
//  SOFComponentsKit
//
//  Created by Preshen Naidoo on 2021/10/21.
//

import Foundation

public extension Date {
    
    func convertDate(by format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let dateString = dateFormatter.string(from: self)
        return dateString
    }
}
