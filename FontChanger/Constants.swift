//
//  Color.swift
//  FontChanger
//
//  Created by Кирилл  Геллерт on 20.02.2022.
//

import UIKit

struct Constants {
    
    static var textColors: [String: UIColor] {
        
        var result: [String: UIColor] = [:]
        
        let interfaceColors = [
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
            .magenta,
        ]
        
        interfaceColors.forEach {
            result[$0.accessibilityName] = $0
        }
        
        return result
    }
    
    static var backgroundColors: [String: UIColor] {
        
        var result: [String: UIColor] = [:]
        
        let interfaceColors = [
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
            .magenta,
        ]
        
        interfaceColors.forEach {
            result[$0.accessibilityName] = $0
        }
        
        return result
    }
    
    static var alignments: [String: NSTextAlignment] = [
        "left": .left,
        "center": .center,
        "right": .right,
        "justified": .justified,
        "natural": .natural
    ]
    
    static var fonts: [String: UIFont] {
        
        var result: [String: UIFont] = [:]
        let allFonts = UIFont.familyNames
        
        allFonts.forEach {
            result[$0] = UIFont(name: $0, size: UIFont.systemFontSize)
        }
        
        return result
    }

    static let defaultText = """
            Test text ;aksjdl;ka dlka;j;lkdaj ;lkad;lk a d;lk has;dhas;dh al;hdl; ahd;la;lkahd ;lkahd;lk hasd;lk hads
        """
    
}
