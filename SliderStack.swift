//
//  SliderStack.swift
//  Slider
//
//  Created by Arshak Vardanov on 05.05.22.
//

import UIKit

class SliderStack: UIStackView {
    var sliderLable: UILabel!
    var slider: UISlider!
    
    init(lableText: String, color: UIColor ) {
        super.init(frame: .zero)
        initLable(text: lableText)
        initSlider(color: color)
        constructHierarchy()
        activateConstraints()
        
        self.axis = .horizontal
    }
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension SliderStack {
    func initSlider(color: UIColor){
        slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.maximumTrackTintColor = .systemGray
        slider.minimumTrackTintColor = color
        slider.isContinuous = true
    }
    func initLable(text: String) {
        sliderLable = UILabel()
        sliderLable.translatesAutoresizingMaskIntoConstraints = false
        sliderLable.textColor = .black
        sliderLable.text = text
        sliderLable.layer.cornerRadius = 12
        sliderLable.font = .systemFont(ofSize: 16)
    }
    func constructHierarchy() {
        addArrangedSubview(sliderLable)
        addArrangedSubview(slider)
    }
    func activateConstraints() {
        NSLayoutConstraint.activate([
            sliderLable.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            slider.widthAnchor.constraint(equalToConstant: 200),
            slider.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
