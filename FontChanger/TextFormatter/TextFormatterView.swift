//
//  FontChangerView.swift
//  FontChanger
//
//  Created by Кирилл  Геллерт on 19.02.2022.
//

import UIKit
import SnapKit

final class TextFormatterView: UIView {
    
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = """
            Test text ;aksjdl;ka dlka;j;lkdaj ;lkad;lk a d;lk has;dhas;dh al;hdl; ahd;la;lkahd ;lkahd;lk hasd;lk hads
        """
        
        return label
    }()
    
    private var setupsView: UIView = {
       return SetupsView()
    }()
    
    init() {
        super.init(frame: CGRect.zero)
        setupView()
    }
    
    private func setupView() {
        backgroundColor = .white
        [textLabel, setupsView].forEach { view in
            addSubview(view)
        }
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        textLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(150)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        setupsView.snp.makeConstraints { make in
            make.top.equalTo(textLabel).offset(150)
            make.bottomMargin.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
