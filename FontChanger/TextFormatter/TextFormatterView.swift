//
//  FontChangerView.swift
//  FontChanger
//
//  Created by Кирилл  Геллерт on 19.02.2022.
//

import UIKit
import SnapKit

protocol TextFormatterViewDelegate: AnyObject {
    func didPropertiesChange(_ properties: Properties)
    func didStartSetup()
}

final class TextFormatterView: UIView {
    
    public var properties: Properties?
    
    private lazy var textView: UITextView = {
        let textView = UITextView()
        textView.text = Constants.defaultText
        textView.contentInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        
        return textView
    }()
    
    private lazy var setupsView: SetupsView = {
        
        return SetupsView(delegate: self)
    }()
    
    private func setupView() {
        backgroundColor = .white
        [textView, setupsView].forEach { view in
            addSubview(view)
        }
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        textView.snp.makeConstraints {
            $0.topMargin.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.bottom.equalTo(setupsView)
        }
        
        setupsView.snp.makeConstraints {
            $0.top.equalTo(textView).offset(UIScreen.main.bounds.height * 0.37)
            $0.bottomMargin.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
    }
    
    init() {
        super.init(frame: CGRect.zero)
        self.properties = Properties()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension TextFormatterView: TextFormatterViewDelegate {
    
    func didStartSetup() {
        textView.resignFirstResponder()
    }
    
    func didPropertiesChange(_ properties: Properties) {
        
        let text = textView.text as NSString
        let currentRange = textView.selectedRange.length > 0 ? textView.selectedRange : (text.range(of: textView.text))
        
        if let textColor = properties.textColor {
            textView.textStorage.addAttribute(.foregroundColor, value: textColor, range: currentRange)
        }
        
        if let font = properties.font {
            textView.textStorage.addAttribute(.font, value: font, range: currentRange)
        }
        
        if let backgroundColor = properties.backgroundColor {
            textView.textStorage.addAttribute(.backgroundColor, value: backgroundColor, range: currentRange)
        }
        
        if let alignment = properties.alignment {
            textView.textAlignment = alignment
        }
        
    }
    
}
