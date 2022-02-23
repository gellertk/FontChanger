//
//  FontChangerViewController.swift
//  FontChanger
//
//  Created by Кирилл  Геллерт on 19.02.2022.
//

import UIKit
import SnapKit

final class TextFormatterViewController: UIViewController{
    
    private var fontChangerView: UIView = {
        
        return TextFormatterView()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    private func setupView() {
        view.addSubview(fontChangerView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        fontChangerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
}
