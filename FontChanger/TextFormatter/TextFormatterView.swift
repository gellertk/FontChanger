//
//  FontChangerView.swift
//  FontChanger
//
//  Created by Кирилл  Геллерт on 19.02.2022.
//

import UIKit
import SnapKit

protocol TextFormatterViewDelegate: AnyObject {
    func didPropertiesChange(properties: Properties)
}

final class TextFormatterView: UIView {
    
    public var properties: Properties?
    
    private lazy var textView: UITextView = {
        let textView = UITextView()
        textView.text = Constants.defaultText
        textView.contentInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        textView.delegate = self
        
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
        self.properties = Properties(textColor: textView.textColor,
                                     shadowColor: textView.layer.shadowColor,
                                     fontStyle: textView.font,
                                     isShadow: textView.layer.shadowRadius > 0,
                                     fontSize: textView.font?.pointSize)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension TextFormatterView: UITextViewDelegate {
    
    func textViewDidChangeSelection(_ textView: UITextView) {
        
    }
    
}

extension TextFormatterView: TextFormatterViewDelegate {
    
    func didPropertiesChange(properties: Properties) {
        textView.textColor = properties.textColor
    }
    
//    let selectedRange = textView.selectedRange
//    //let myAttribute: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: CGFloat(value))]
//    textView.textStorage.addAttribute(.font,
//                                      value: UIFont.systemFont(ofSize: CGFloat(value)),
//                                      range: selectedRange)
//    let selectedRange = textView.selectedRange
//    //let myAttribute: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: CGFloat(value))]
//    textView.textStorage.addAttribute(.foregroundColor, value: color, range: selectedRange)
//    textView.textStorage.addAttribute(.font,
//                                      value: UIFont.systemFont(ofSize: CGFloat(value)),
//                                      range: selectedRange)
}
