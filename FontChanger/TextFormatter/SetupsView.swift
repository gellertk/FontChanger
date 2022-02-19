//
//  SetupsView.swift
//  FontChanger
//
//  Created by Кирилл  Геллерт on 19.02.2022.
//

import UIKit

final class SetupsView: UIView {
    
    private var fontSizeLabel: UILabel = {
        let label = UILabel()
        label.text = "Font size"
        
        return label
    }()
    
    private var fontSizeSlider: UISlider = {
        let slider = UISlider()
        
        return slider
    }()
    
    private var textColorLabel: UILabel = {
        let label = UILabel()
        label.text = "Text color"
        
        return label
    }()
    
    private lazy var textColorPickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.dataSource = self
        
        return pickerView
    }()
    
    private var fontStyleLabel: UILabel = {
        let label = UILabel()
        label.text = "Font style"
        
        return label
    }()
    
    private lazy var fontStylePickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.dataSource = self
        
        return pickerView
    }()
    
    private var numberOfLinesLabel: UILabel = {
        let label = UILabel()
        label.text = "Number of lines"
        
        return label
    }()
    
    private lazy var numberOfLinesPickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.dataSource = self
        
        return pickerView
    }()
    
    private var colorOfShadowLabel: UILabel = {
        let label = UILabel()
        label.text = "Color of shadow"
        
        return label
    }()
    
    private lazy var colorOfShadowPickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.dataSource = self
        
        return pickerView
    }()
    
    init() {
        super.init(frame: CGRect.zero)
        setupView()
    }
    
    private func setupView() {
        backgroundColor = .white
        layer.borderColor = UIColor.black.cgColor
        [fontSizeLabel,
         fontSizeSlider,
         textColorLabel,
         textColorPickerView,
         fontStyleLabel,
         fontStylePickerView,
         numberOfLinesLabel
        ].forEach {
            
            addSubview($0)
        }
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        fontSizeLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(20)
        }
        
        fontSizeSlider.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(fontSizeLabel.snp.bottom).offset(5)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        textColorLabel.snp.makeConstraints {
            $0.top.equalTo(fontSizeSlider.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(100)
        }
        
        textColorPickerView.snp.makeConstraints {
            $0.top.equalTo(textColorLabel.snp.bottom)
            $0.leading.equalTo(textColorLabel).offset(-10)
            $0.height.equalTo(80)
            $0.width.equalTo(textColorLabel.snp.width)
        }
        
        fontStyleLabel.snp.makeConstraints {
            $0.centerY.equalTo(textColorLabel.snp.centerY)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        fontStylePickerView.snp.makeConstraints {
            $0.width.height.equalTo(textColorPickerView)
            $0.top.equalTo(fontStyleLabel.snp.bottom)
            $0.trailing.equalTo(fontStyleLabel).offset(10)
        }
        
        numberOfLinesLabel.snp.makeConstraints {
            $0.top.equalTo(fontStyleLabel.snp.bottom).offset(50)
            $0.width.equalTo(textColorLabel)
            $0.
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension SetupsView: UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return 5
    }
        
}

extension SetupsView: UIPickerViewDataSource {
    
    
    
}
