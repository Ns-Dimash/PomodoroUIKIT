//
//  Sheet.swift
//  PomodoroUiKit
//
//  Created by Dimash Nsanbaev on 5/7/23.
//

import UIKit
import SnapKit

class Sheet: UIViewController {
    
    var cntbg = 0
    var firstVC = FirstViewController()
    
    lazy var topTitle :UILabel = {
        let label = UILabel()
        label.text = "Focus Category"
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    private lazy var firstbgButton:UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 234 / 255, green: 234 / 255, blue: 234 / 255, alpha: 1)
        button.tag = 1
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Work", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        button.addTarget(self, action: #selector(firstbg), for: .touchUpInside)
        button.layer.cornerRadius = 24
        return button
    }()
    private lazy var secondbgButton:UIButton = {
        let button = UIButton()
        button.tag = 2
        button.backgroundColor = UIColor(red: 234 / 255, green: 234 / 255, blue: 234 / 255, alpha: 1)
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Study", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        button.addTarget(self, action: #selector(secondbg), for: .touchUpInside)
        
        button.layer.cornerRadius = 24
        return button
    }()
    private lazy var thirdbgButton:UIButton = {
        let button = UIButton()
        button.tag = 3
        button.backgroundColor = UIColor(red: 234 / 255, green: 234 / 255, blue: 234 / 255, alpha: 1)
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Workout", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        button.addTarget(self, action: #selector(thirdbg), for: .touchUpInside)
        
        button.layer.cornerRadius = 24
        return button
    }()
    private lazy var fourthbgButton:UIButton = {
        let button = UIButton()
        button.tag = 4
        button.backgroundColor = UIColor(red: 234 / 255, green: 234 / 255, blue: 234 / 255, alpha: 1)
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Reading", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        button.addTarget(self, action: #selector(fourthbg), for: .touchUpInside)
        
        button.layer.cornerRadius = 24
        return button
    }()
    private lazy var fifthbgButton:UIButton = {
        let button = UIButton()
        button.tag = 5
        button.backgroundColor = UIColor(red: 234 / 255, green: 234 / 255, blue: 234 / 255, alpha: 1)
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Meditation", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        button.addTarget(self, action: #selector(fifthbg), for: .touchUpInside)
        
        button.layer.cornerRadius = 24
        return button
    }()
    private lazy var sixthbgButton:UIButton = {
        let button = UIButton()
        button.tag = 6
        button.backgroundColor = UIColor(red: 234 / 255, green: 234 / 255, blue: 234 / 255, alpha: 1)
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Others", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        button.addTarget(self, action: #selector(sixthbg), for: .touchUpInside)
        button.layer.cornerRadius = 24
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        [topTitle,firstbgButton,secondbgButton,thirdbgButton,fourthbgButton,fifthbgButton,sixthbgButton].forEach {
            view.addSubview($0)
        }
        constraint()
        
    }
    
    //MARK: - AddTarget
    
    @objc func firstbg(){
        
        cntbg+=1
        FirstViewController.bgImage.image = UIImage(named: "first")
        if cntbg == firstbgButton.tag{
            firstbgButton.backgroundColor = UIColor(red: 47 / 255, green: 47 / 255, blue: 51 / 255, alpha: 1)
            firstbgButton.setTitleColor(.white, for: .normal)
            secondbgButton.backgroundColor = UIColor(red: 234 / 255, green: 234 / 255, blue: 234 / 255, alpha: 1)
            secondbgButton.setTitleColor(.black, for: .normal)
            thirdbgButton.backgroundColor = UIColor(red: 234 / 255, green: 234 / 255, blue: 234 / 255, alpha: 1)
            thirdbgButton.setTitleColor(.black, for: .normal)
            fourthbgButton.backgroundColor = UIColor(red: 234 / 255, green: 234 / 255, blue: 234 / 255, alpha: 1)
            fourthbgButton.setTitleColor(.black, for: .normal)
            fifthbgButton.backgroundColor = UIColor(red: 234 / 255, green: 234 / 255, blue: 234 / 255, alpha: 1)
            fifthbgButton.setTitleColor(.black, for: .normal)
            sixthbgButton.backgroundColor = UIColor(red: 234 / 255, green: 234 / 255, blue: 234 / 255, alpha: 1)
            sixthbgButton.setTitleColor(.black, for: .normal)
        }
        cntbg = 0

    }
    @objc func secondbg(){
        cntbg+=2
        FirstViewController.bgImage.image = UIImage(named: "second")
        if cntbg == secondbgButton.tag{
            secondbgButton.backgroundColor = UIColor(red: 47 / 255, green: 47 / 255, blue: 51 / 255, alpha: 1)
            secondbgButton.setTitleColor(.white, for: .normal)
            firstbgButton.backgroundColor = UIColor(red: 234 / 255, green: 234 / 255, blue: 234 / 255, alpha: 1)
            firstbgButton.setTitleColor(.black, for: .normal)
            thirdbgButton.backgroundColor = UIColor(red: 234 / 255, green: 234 / 255, blue: 234 / 255, alpha: 1)
            thirdbgButton.setTitleColor(.black, for: .normal)
            fourthbgButton.backgroundColor = UIColor(red: 234 / 255, green: 234 / 255, blue: 234 / 255, alpha: 1)
            fourthbgButton.setTitleColor(.black, for: .normal)
            fifthbgButton.backgroundColor = UIColor(red: 234 / 255, green: 234 / 255, blue: 234 / 255, alpha: 1)
            fifthbgButton.setTitleColor(.black, for: .normal)
            sixthbgButton.backgroundColor = UIColor(red: 234 / 255, green: 234 / 255, blue: 234 / 255, alpha: 1)
            sixthbgButton.setTitleColor(.black, for: .normal)
        }
        cntbg = 0

    }
    @objc func thirdbg(){
        cntbg+=3
        FirstViewController.bgImage.image = UIImage(named: "third")

        if cntbg == thirdbgButton.tag{
            
            thirdbgButton.backgroundColor = UIColor(red: 47 / 255, green: 47 / 255, blue: 51 / 255, alpha: 1)
            thirdbgButton.setTitleColor(.white, for: .normal)
            firstbgButton.backgroundColor = UIColor(red: 234 / 255, green: 234 / 255, blue: 234 / 255, alpha: 1)
            firstbgButton.setTitleColor(.black, for: .normal)
            secondbgButton.backgroundColor = UIColor(red: 234 / 255, green: 234 / 255, blue: 234 / 255, alpha: 1)
            secondbgButton.setTitleColor(.black, for: .normal)
            fourthbgButton.backgroundColor = UIColor(red: 234 / 255, green: 234 / 255, blue: 234 / 255, alpha: 1)
            fourthbgButton.setTitleColor(.black, for: .normal)
            fifthbgButton.backgroundColor = UIColor(red: 234 / 255, green: 234 / 255, blue: 234 / 255, alpha: 1)
            fifthbgButton.setTitleColor(.black, for: .normal)
            sixthbgButton.backgroundColor = UIColor(red: 234 / 255, green: 234 / 255, blue: 234 / 255, alpha: 1)
            sixthbgButton.setTitleColor(.black, for: .normal)
        }
        cntbg = 0

    }
    @objc func fourthbg(){
        cntbg+=4
        FirstViewController.bgImage.image = UIImage(named: "fourth")

        if cntbg == fourthbgButton.tag{
            
            fourthbgButton.backgroundColor = UIColor(red: 47 / 255, green: 47 / 255, blue: 51 / 255, alpha: 1)
            fourthbgButton.setTitleColor(.white, for: .normal)
            firstbgButton.backgroundColor = UIColor(red: 234 / 255, green: 234 / 255, blue: 234 / 255, alpha: 1)
            firstbgButton.setTitleColor(.black, for: .normal)
            thirdbgButton.backgroundColor = UIColor(red: 234 / 255, green: 234 / 255, blue: 234 / 255, alpha: 1)
            thirdbgButton.setTitleColor(.black, for: .normal)
            secondbgButton.backgroundColor = UIColor(red: 234 / 255, green: 234 / 255, blue: 234 / 255, alpha: 1)
            secondbgButton.setTitleColor(.black, for: .normal)
            fifthbgButton.backgroundColor = UIColor(red: 234 / 255, green: 234 / 255, blue: 234 / 255, alpha: 1)
            fifthbgButton.setTitleColor(.black, for: .normal)
            sixthbgButton.backgroundColor = UIColor(red: 234 / 255, green: 234 / 255, blue: 234 / 255, alpha: 1)
            sixthbgButton.setTitleColor(.black, for: .normal)
        }
        cntbg = 0

    }
    @objc func fifthbg(){
        cntbg+=5
        
        FirstViewController.bgImage.image = UIImage(named: "fifth")

        if cntbg == fifthbgButton.tag{
            
            fifthbgButton.backgroundColor = UIColor(red: 47 / 255, green: 47 / 255, blue: 51 / 255, alpha: 1)
            fifthbgButton.setTitleColor(.white, for: .normal)
            firstbgButton.backgroundColor = UIColor(red: 234 / 255, green: 234 / 255, blue: 234 / 255, alpha: 1)
            firstbgButton.setTitleColor(.black, for: .normal)
            thirdbgButton.backgroundColor = UIColor(red: 234 / 255, green: 234 / 255, blue: 234 / 255, alpha: 1)
            thirdbgButton.setTitleColor(.black, for: .normal)
            secondbgButton.backgroundColor = UIColor(red: 234 / 255, green: 234 / 255, blue: 234 / 255, alpha: 1)
            secondbgButton.setTitleColor(.black, for: .normal)
            fourthbgButton.backgroundColor = UIColor(red: 234 / 255, green: 234 / 255, blue: 234 / 255, alpha: 1)
            fourthbgButton.setTitleColor(.black, for: .normal)
            sixthbgButton.backgroundColor = UIColor(red: 234 / 255, green: 234 / 255, blue: 234 / 255, alpha: 1)
            sixthbgButton.setTitleColor(.black, for: .normal)
        }
        cntbg = 0

    }
    @objc func sixthbg(){
        cntbg+=6
        FirstViewController.bgImage.image = UIImage(named: "pomodoroBg")

        if cntbg == sixthbgButton.tag{
            
            sixthbgButton.backgroundColor = UIColor(red: 47 / 255, green: 47 / 255, blue: 51 / 255, alpha: 1)
            sixthbgButton.setTitleColor(.white, for: .normal)
            
            firstbgButton.backgroundColor = UIColor(red: 234 / 255, green: 234 / 255, blue: 234 / 255, alpha: 1)
            firstbgButton.setTitleColor(.black, for: .normal)
            thirdbgButton.backgroundColor = UIColor(red: 234 / 255, green: 234 / 255, blue: 234 / 255, alpha: 1)
            thirdbgButton.setTitleColor(.black, for: .normal)
            secondbgButton.backgroundColor = UIColor(red: 234 / 255, green: 234 / 255, blue: 234 / 255, alpha: 1)
            secondbgButton.setTitleColor(.black, for: .normal)
            fourthbgButton.backgroundColor = UIColor(red: 234 / 255, green: 234 / 255, blue: 234 / 255, alpha: 1)
            fourthbgButton.setTitleColor(.black, for: .normal)
            fifthbgButton.backgroundColor = UIColor(red: 234 / 255, green: 234 / 255, blue: 234 / 255, alpha: 1)
            fifthbgButton.setTitleColor(.black, for: .normal)
        }
        cntbg = 0

    }
    
    
    
    
    
    
    private func constraint(){
        topTitle.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(20)
        }
        firstbgButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.top.equalTo(topTitle.snp.bottom).offset(20)
            make.width.equalTo(172)
            make.height.equalTo(60)
        }
        secondbgButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(20)
            make.top.equalTo(topTitle.snp.bottom).offset(20)
            make.width.equalTo(172)
            make.height.equalTo(60)
        }
        thirdbgButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.top.equalTo(firstbgButton.snp.bottom).offset(20)
            make.width.equalTo(172)
            make.height.equalTo(60)
        }
        fourthbgButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(20)
            make.top.equalTo(secondbgButton.snp.bottom).offset(20)
            make.width.equalTo(172)
            make.height.equalTo(60)
        }
        fifthbgButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.top.equalTo(thirdbgButton.snp.bottom).offset(20)
            make.width.equalTo(172)
            make.height.equalTo(60)
        }
        sixthbgButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(20)
            make.top.equalTo(fourthbgButton.snp.bottom).offset(20)
            make.width.equalTo(172)
            make.height.equalTo(60)
        }
        
    }
}
