//
//  SetupsView.swift
//  FontChanger
//
//  Created by Кирилл  Геллерт on 19.02.2022.
//

import UIKit

final class SetupsView: UIView {
    
    public weak var delegate: TextFormatterViewDelegate?
    private var pickerViewAndProperties: [UIPickerView: [String]] = [:]
    
    private var fontSizeLabel: UILabel = {
        let label = UILabel()
        label.text = "Font size"
        
        return label
    }()
    
    private var fontSizeSlider: UISlider = {
        let slider = UISlider()
        slider.tintColor = .lightGray
        slider.value = 0.5
        slider.addTarget(self, action: #selector(fontSizeSliderValueChange(slider:)), for: .valueChanged)
        
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
        pickerView.delegate = self
        pickerViewAndProperties[pickerView] = Constants.colors
        
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
        pickerView.delegate = self
        pickerViewAndProperties[pickerView] = Constants.fontStyles
        
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
        pickerView.delegate = self

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
        pickerView.delegate = self
        pickerViewAndProperties[pickerView] = Constants.colors
        
        return pickerView
    }()
    
    private var shadowLabel: UILabel = {
        let label = UILabel()
        label.text = "Shadow"
        
        return label
    }()
    
    private var shadowSwitch: UISwitch = {
        let shadowSwitch = UISwitch()
        
        return shadowSwitch
    }()
    
    private var worldWrapLabel: UILabel = {
        let label = UILabel()
        label.text = "World Wrap"
        
        return label
    }()
    
    private var worldWrapSwitch: UISwitch = {
        let shadowSwitch = UISwitch()
        
        return shadowSwitch
    }()
    
    private func setupView() {
        backgroundColor = .white
        layer.borderColor = UIColor.black.cgColor
        [fontSizeLabel,
         fontSizeSlider,
         textColorLabel,
         textColorPickerView,
         fontStyleLabel,
         fontStylePickerView,
         numberOfLinesLabel,
         numberOfLinesPickerView,
         colorOfShadowLabel,
         colorOfShadowPickerView,
         shadowLabel,
         shadowSwitch,
         worldWrapLabel,
         worldWrapSwitch
        ].forEach {
            
            addSubview($0)
        }
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        fontSizeLabel.snp.makeConstraints {
            $0.centerX.top.equalToSuperview()
        }
        
        fontSizeSlider.snp.makeConstraints {
            $0.top.equalTo(fontSizeLabel.snp.bottom).offset(5)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(UIScreen.main.bounds.width * 0.6)
        }
        
        textColorLabel.snp.makeConstraints {
            $0.top.equalTo(fontSizeSlider.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(50)
            $0.width.equalTo(80)
        }
        
        textColorPickerView.snp.makeConstraints {
            $0.top.equalTo(textColorLabel.snp.bottom)
            $0.centerX.equalTo(textColorLabel)
            $0.height.equalTo(80)
            $0.width.equalTo(150)
        }
        
        fontStyleLabel.snp.makeConstraints {
            $0.centerY.width.equalTo(textColorLabel)
            $0.trailing.equalToSuperview().offset(-50)
            $0.width.equalTo(80)
        }
        
        fontStylePickerView.snp.makeConstraints {
            $0.top.equalTo(fontStyleLabel.snp.bottom)
            $0.centerX.equalTo(fontStyleLabel)
            $0.width.height.equalTo(textColorPickerView)
        }
        
        numberOfLinesLabel.snp.makeConstraints {
            $0.top.equalTo(textColorPickerView.snp.bottom).offset(50)
            $0.centerX.equalTo(textColorLabel)
        }
        
        numberOfLinesPickerView.snp.makeConstraints {
            $0.top.equalTo(numberOfLinesLabel.snp.bottom)
            $0.centerX.equalTo(numberOfLinesLabel)
            $0.width.height.equalTo(textColorPickerView)
        }
        
        colorOfShadowLabel.snp.makeConstraints {
            $0.centerX.equalTo(fontStyleLabel)
            $0.centerY.equalTo(numberOfLinesLabel)
        }
        
        colorOfShadowPickerView.snp.makeConstraints {
            $0.top.equalTo(colorOfShadowLabel.snp.bottom)
            $0.centerX.equalTo(colorOfShadowLabel)
            $0.width.height.equalTo(textColorPickerView)
        }
        
        shadowLabel.snp.makeConstraints {
            $0.top.equalTo(numberOfLinesPickerView.snp.bottom).offset(50)
            $0.leading.equalTo(textColorLabel)
        }
        
        shadowSwitch.snp.makeConstraints {
            $0.centerX.equalTo(fontStyleLabel)
            $0.centerY.equalTo(shadowLabel)
        }
        
        worldWrapLabel.snp.makeConstraints {
            $0.top.equalTo(shadowLabel.snp.bottom).offset(20)
            $0.leading.equalTo(shadowLabel)
        }
        
        worldWrapSwitch.snp.makeConstraints {
            $0.centerX.equalTo(fontStyleLabel)
            $0.centerY.equalTo(worldWrapLabel)
        }
        
    }
    
    @objc private func fontSizeSliderValueChange(slider: UISlider) {
        delegate?.fontSizeSliderValueChange(value: slider.value)
    }
    
    init() {
        super.init(frame: CGRect.zero)
        setupView()
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension SetupsView: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if let values = pickerViewAndProperties[pickerView] {
            return values.count
        }
        
        return 5
    }
    
}

extension SetupsView: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        if let values = pickerViewAndProperties[pickerView] {
            let label = UILabel()
            label.text = values[row]
            label.textColor = .black
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 11)
            
            return label
        }
        
        return UILabel()
    }
   
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if let values = pickerViewAndProperties[pickerView] {
            
            return values[row]
        }
        
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        delegate?.textColorValueChange(color: <#T##UIColor#>)
    }
    
}
