//
//  Properties.swift
//  FontChanger
//
//  Created by Кирилл  Геллерт on 21.02.2022.
//

import UIKit

struct Properties {
    
    var textColor: UIColor?
    var backgroundColor: UIColor?
    var font: UIFont? {
        
        didSet {
            guard let fontSize = fontSize else {
                return
            }
            
            if let font = font {
                let currentFontName = font.familyName
                self.font = UIFont(name: currentFontName, size: fontSize)
            } else {
                self.font = UIFont.systemFont(ofSize: fontSize)
            }
        }
        
    }
    var fontSize: CGFloat? {
        
        didSet {
            guard let fontSize = fontSize else {
                return
            }
            
            if let font = font {
                let currentFontName = font.familyName
                self.font = UIFont(name: currentFontName, size: fontSize)
            } else {
                self.font = UIFont.systemFont(ofSize: fontSize)
            }
        }
        
    }
    var alignment: NSTextAlignment?
    
}
