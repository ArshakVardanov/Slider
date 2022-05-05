//
//  ViewController.swift
//  Slider
//
//  Created by Arshak Vardanov on 05.05.22.
//

import UIKit

class ViewController: UIViewController {
    var titleLable: UILabel!
    var vertStack: UIStackView!
    var fontSlider: SliderStack!
    var redSlider: SliderStack!
    var greenSlider: SliderStack!
    var blueSlider: SliderStack!
    
    @objc func fontSliderValueChange(_ sender: UISlider) {
        titleLable.font = .systemFont(ofSize: CGFloat(sender.value))
    }
    
    @objc func colorSliderColorChange() {
        titleLable.textColor = UIColor(
            red: CGFloat(redSlider.slider.value),
            green: CGFloat(greenSlider.slider.value),
            blue: CGFloat(blueSlider.slider.value),
            alpha: 1
        )
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        common()
        fontSlider.slider.addTarget(self, action: #selector(self.fontSliderValueChange), for: .valueChanged)
        redSlider.slider.addTarget(self, action: #selector(self.colorSliderColorChange), for: .valueChanged)
        greenSlider.slider.addTarget(self, action: #selector(self.colorSliderColorChange), for: .valueChanged)
        blueSlider.slider.addTarget(self, action: #selector(self.colorSliderColorChange), for: .valueChanged)
    }


}

extension ViewController {
    func common() {
        initLable()
        initVertStack()
        createSliders()
        constructHierarchy()
        activateConstraints()
        
    }
    func initVertStack() {
        vertStack = UIStackView()
        vertStack.translatesAutoresizingMaskIntoConstraints = false
        vertStack.axis = .vertical
        vertStack.spacing = 10
    }
    func createSliders() {
        fontSlider = SliderStack(lableText: "Font", color: .blue)
        fontSlider.translatesAutoresizingMaskIntoConstraints = false
        fontSlider.spacing = 10
        fontSlider.slider.minimumValue = 20
        fontSlider.slider.maximumValue = 80
        
        redSlider = SliderStack(lableText: "Red Color", color: .systemRed)
        redSlider.translatesAutoresizingMaskIntoConstraints = false
        redSlider.spacing = 10
        
        greenSlider = SliderStack(lableText: "Green Color", color: .systemGreen)
        greenSlider.translatesAutoresizingMaskIntoConstraints = false
        greenSlider.spacing = 10
        
        blueSlider = SliderStack(lableText: "Blue Color", color: .systemBlue)
        blueSlider.translatesAutoresizingMaskIntoConstraints = false
        blueSlider.spacing = 10
    }
    func initLable() {
        titleLable = UILabel()
        titleLable.translatesAutoresizingMaskIntoConstraints = false
        titleLable.textColor = .black
        titleLable.text = "Title"
        titleLable.layer.cornerRadius = 12
        titleLable.textAlignment = .center
        titleLable.font = .systemFont(ofSize: 20)
    }
    
    func constructHierarchy() {
        view.addSubview(titleLable)
        view.addSubview(vertStack)
        vertStack.addArrangedSubview(fontSlider)
        vertStack.addArrangedSubview(redSlider)
        vertStack.addArrangedSubview(greenSlider)
        vertStack.addArrangedSubview(blueSlider)
    }
    func activateConstraints() {
        NSLayoutConstraint.activate([
            titleLable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            
            vertStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            vertStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150),
            
            fontSlider.leadingAnchor.constraint(equalTo: vertStack.leadingAnchor),
            
            redSlider.leadingAnchor.constraint(equalTo: vertStack.leadingAnchor),
            
            greenSlider.leadingAnchor.constraint(equalTo: vertStack.leadingAnchor),
            
            blueSlider.leadingAnchor.constraint(equalTo: vertStack.leadingAnchor),
        ])
    }
}
