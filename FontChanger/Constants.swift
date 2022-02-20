//
//  Color.swift
//  FontChanger
//
//  Created by Кирилл  Геллерт on 20.02.2022.
//

import UIKit

struct Constants {
    
    static var colors: [String] {
        let colors: [UIColor] = [
            UIColor.lightGray,
            .white,
            .label,
            .blue,
            .brown,
            .clear,
            .cyan,
            .darkGray,
            .darkText,
            .gray,
            .green,
            .lightText,
            .lightGray,
            .brown,
            .magenta,
        ]
        return colors.map { $0.accessibilityName }
    }

    static let fontStyles = UIFont.familyNames
    
}
