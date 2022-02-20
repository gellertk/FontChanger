//
//  FontChangerView.swift
//  FontChanger
//
//  Created by Кирилл  Геллерт on 19.02.2022.
//

import UIKit
import SnapKit

protocol TextFormatterViewDelegate: AnyObject {
    func fontSizeSliderValueChange(value: Float)
    func textColorValueChange(color: UIColor)
}

final class TextFormatterView: UIView, TextFormatterViewDelegate {
    
    private lazy var textView: UITextView = {
        let textView = UITextView()
        textView.text = """
            Test text ;aksjdl;ka dlka;j;lkdaj ;lkad;lk a d;lk has;dhas;dh al;hdl; ahd;la;lkahd ;lkahd;lk hasd;lk hads
        """
        textView.contentInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        textView.delegate = self
        
        return textView
    }()
    
    private var setupsView: SetupsView = {
        
       return SetupsView()
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
    
    func didFontSizeChange(value: Float) {
        let selectedRange = textView.selectedRange
        //let myAttribute: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: CGFloat(value))]
        textView.textStorage.addAttribute(.font, value: UIFont.systemFont(ofSize: CGFloat(value)), range: selectedRange)
        
        
//        let range = textView.selectedRange
//          let string = NSMutableAttributedString(attributedString:
//          textView.attributedText)
//        let attributes = [NSForegroundColorAttributeName: UIColor.re]
//           string.addAttributes(attributes, range: textView.selectedRange)
//          textView.attributedText = string
//          textView.selectedRange = range
    }
    
    func fontSizeSliderValueChange(value: Float) {
        let selectedRange = textView.selectedRange
        //let myAttribute: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: CGFloat(value))]
        textView.textStorage.addAttribute(.font, value: UIFont.systemFont(ofSize: CGFloat(value)), range: selectedRange)
    }
    
    func textColorValueChange(color: UIColor) {
        let selectedRange = textView.selectedRange
        //let myAttribute: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: CGFloat(value))]
        textView.textStorage.addAttribute(.foregroundColor, value: color, range: selectedRange)
    }
    
    init() {
        super.init(frame: CGRect.zero)
        setupsView.delegate = self
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
