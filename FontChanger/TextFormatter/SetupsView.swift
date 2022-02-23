//
//  SetupsView.swift
//  FontChanger
//
//  Created by Кирилл  Геллерт on 19.02.2022.
//

import UIKit

final class SetupsView: UIView {
    
    public weak var delegate: TextFormatterViewDelegate?
    
    private var properties: Properties
    private var pickerViewAndItems: [UIPickerView: [String: Any]] = [:]
    
    private var fontSizeLabel: UILabel = {
        let label = UILabel()
        label.text = "Font size"
        
        return label
    }()
    
    private var fontSizeSlider: UISlider = {
        let slider = UISlider()
        slider.tintColor = .lightGray
        slider.value = Float(UIFont.systemFontSize)
        slider.maximumValue = 100
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
        pickerView.tag = 0
        pickerViewAndItems[pickerView] = Constants.textColors
        
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
        pickerViewAndItems[pickerView] = Constants.fonts
        pickerView.tag = 2
        
        return pickerView
    }()
    
    private var alignmentLabel: UILabel = {
        let label = UILabel()
        label.text = "Alignment"
        
        return label
    }()
    
    private lazy var alignmentPickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.dataSource = self
        pickerView.delegate = self
        pickerViewAndItems[pickerView] = Constants.alignments
        pickerView.tag = 3
        
        return pickerView
    }()
    
    private var backgroundColorLabel: UILabel = {
        let label = UILabel()
        label.text = "Background color"
        
        return label
    }()
    
    private lazy var backgroundColorPickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.dataSource = self
        pickerView.delegate = self
        pickerViewAndItems[pickerView] = Constants.backgroundColors
        pickerView.tag = 1
        
        return pickerView
    }()
    
    private func setupView() {
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 2
        backgroundColor = .white
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:))))
        
        layer.borderColor = UIColor.black.cgColor
        [fontSizeLabel,
         fontSizeSlider,
         textColorLabel,
         textColorPickerView,
         fontStyleLabel,
         fontStylePickerView,
         alignmentLabel,
         alignmentPickerView,
         backgroundColorLabel,
         backgroundColorPickerView
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
            $0.height.equalTo(100)
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
        
        alignmentLabel.snp.makeConstraints {
            $0.top.equalTo(textColorPickerView.snp.bottom).offset(80)
            $0.centerX.equalTo(textColorLabel)
        }
        
        alignmentPickerView.snp.makeConstraints {
            $0.top.equalTo(alignmentLabel.snp.bottom)
            $0.centerX.equalTo(alignmentLabel)
            $0.width.height.equalTo(textColorPickerView)
        }
        
        backgroundColorLabel.snp.makeConstraints {
            $0.centerX.equalTo(fontStyleLabel)
            $0.centerY.equalTo(alignmentLabel)
        }
        
        backgroundColorPickerView.snp.makeConstraints {
            $0.top.equalTo(backgroundColorLabel.snp.bottom)
            $0.centerX.equalTo(backgroundColorLabel)
            $0.width.height.equalTo(textColorPickerView)
        }
        
    }
    
    @objc private func fontSizeSliderValueChange(slider: UISlider) {
        properties.fontSize = CGFloat(slider.value)
        delegate?.didPropertiesChange(properties)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        delegate?.didStartSetup()
    }
    
    init(delegate: TextFormatterViewDelegate) {
        self.delegate = delegate
        self.properties = Properties()
        super.init(frame: CGRect.zero)
        setupView()
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
        
        if let values = pickerViewAndItems[pickerView] {
            
            return values.count
        }
        
        return 5
    }
    
}

extension SetupsView: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView,
                    viewForRow row: Int,
                    forComponent component: Int,
                    reusing view: UIView?) -> UIView {
        
        if let items = pickerViewAndItems[pickerView] {
            let label = UILabel()
            label.text = Array(items.keys)[row]
            label.textColor = .black
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 11)
            
            return label
        }
        
        return UILabel()
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if let items = pickerViewAndItems[pickerView]?.keys {

            return Array(items)[row]
        }
        
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if let values = pickerViewAndItems[pickerView]?.values {
            switch pickerView.tag {
                case 0: properties.textColor = Array(values)[row] as? UIColor
                case 1: properties.backgroundColor = (Array(values)[row] as? UIColor)
                case 2: properties.font = (Array(values)[row] as? UIFont)
                case 3: properties.alignment = (Array(values)[row] as? NSTextAlignment)
            default:
                break
            }
        }
        
        delegate?.didPropertiesChange(properties)
    }
    
}
