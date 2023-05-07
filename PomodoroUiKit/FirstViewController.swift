//
//  ViewController.swift
//  PomodoroUiKit
//
//  Created by Dimash Nsanbaev on 5/4/23.
//



import UIKit
import ALProgressView
import SnapKit
import AudioToolbox

class FirstViewController: UIViewController {
    var cycle = 0
    var cnt = 0
    var timer = Timer()
    var isTimerStarted = false
    var time = 1500
    var count = 0
    var timeTwo = 0
    var prog = 0.0
    var breakRes = 0.0
    lazy var second:Int = {
        return time
    }()
    
    private lazy var progressRing = ALProgressRing()
    
     static var bgImage:UIImageView = {
        let imageView = UIImageView()
         
        imageView.image = UIImage(named: "pomodoroBg")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var button:UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.3)
        button.setImage(UIImage(named: "ruchka"), for: .normal)
        button.setTitle("Focus Category", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        button.layer.cornerRadius = 24
        let spacing: CGFloat = 8 // Set the spacing you want
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: spacing)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: spacing, bottom: 0, right: 0)
        button.addTarget(self, action: #selector(showSheet), for: .touchUpInside)
        return button
    }()
    
    lazy private var timeLabel:UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "25:00"
        label.font = .systemFont(ofSize: 44, weight: .bold)
        return label
    }()
    
    lazy private var breakOrFocus:UILabel = {
        let label = UILabel()
        label.text = "Focus on your task"
        label.textColor = .white
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    lazy private var cancelButton: UIButton = {
        let button = UIButton()
//        button.setTitle("Cancel", for: .normal)
        button.setImage(UIImage(named: "StopPomo"), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        button.addTarget(self, action: #selector(cancelTap), for: .touchUpInside)
        
        return button
    }()
    
    lazy private var startButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.systemRed,for: .normal)
//        button.setTitle("Start", for: .normal)
        button.setImage(UIImage(named: "PlayPomo"), for: .normal)
        button.addTarget(self, action: #selector(startTap), for: .touchUpInside)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        return button
    }()
    
    @objc func startTap(){
        cancelButton.isEnabled = true
        cancelButton.alpha = 1.0
        if !isTimerStarted{
            
            startTimer()
            isTimerStarted = true
            startButton.setImage(UIImage(named: "PausePomo"), for: .normal)
            startButton.setTitleColor(UIColor.orange, for: .normal)
            
            
        }else {
            timer.invalidate()
            isTimerStarted = false
            startButton.setImage(UIImage(named: "PlayPomo"), for: .normal)
            startButton.setTitleColor(UIColor.green, for: .normal)
        }
        
    }
    @objc func cancelTap(){
        prog = 0
        progressRing.setProgress(1, animated: true)
        cancelButton.isEnabled = false
        
        timer.invalidate()
        if timeTwo == 0{
            time = second
            timeLabel.text = "25:00"
        }else{
            time = timeTwo
            timeLabel.text = "\(time/60):00"
            
        }
        isTimerStarted = false
        //        timeLabel.text = "25:00"
        startButton.setImage(UIImage(named: "PlayPomo"), for: .normal)
        
    }
    
    @objc func showSheet(){
        let vc = Sheet()
        if let sheet = vc.sheetPresentationController{
            sheet.detents = [
                    .custom { _ in
                        return 300
                    }
                ]
            sheet.prefersScrollingExpandsWhenScrolledToEdge = true
        }
        present(vc,animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        [FirstViewController.bgImage,button,progressRing,timeLabel,breakOrFocus,startButton,cancelButton].forEach{
            view.addSubview($0)
        }
        
        constraint()
        
        progressRing.setProgress(1, animated: true)
        progressRing.ringWidth = 6
        progressRing.lineWidth = 6
        progressRing.startColor = .gray
        progressRing.endColor = .gray
        progressRing.alpha = 0.5
        progressRing.grooveColor = .white

        
    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer(){
        time -= 1
        timeLabel.text = formatTime()
        
        
        
        if cycle == 0 || cycle%2 == 0{
            let res:Double = 1/Double(second)
            prog+=res
            progressRing.setProgress(Float(prog), animated: true)
        }else{
            
            prog+=0.0033333333333333335
            progressRing.setProgress(Float(prog), animated: true)
        }
        
        
        if timeLabel.text == "00:00"{
            cycle += 1
            cnt+=1
            prog = 0
            print(cycle)
            progressRing.setProgress(0, animated: true)
            AudioServicesPlayAlertSoundWithCompletion(SystemSoundID(kSystemSoundID_Vibrate)) {}
            if cnt % 2 == 0{
                breakOrFocus.text = "Focus on your task"
                if timeTwo == 0{
                    time = second
                }else{
                    time = timeTwo
                }
                count+=1
                
            }else{
                breakOrFocus.text = "Break"
                time = 300
                prog = 0
            }
        }
    }
    
    
    func formatTime()->String{
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i", minutes, seconds)
        
    }
    
    private func constraint(){
        FirstViewController.bgImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            
        }
        button.snp.makeConstraints { make in
            make.width.equalTo(170)
            make.height.equalTo(36)
            make.top.equalToSuperview().offset(164)
            make.centerX.equalToSuperview()
        }
        progressRing.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(252)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(248)
        }
        
        
        timeLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(320)
            make.centerX.equalToSuperview()
        }
        breakOrFocus.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(380)

        }
        cancelButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(560)
            make.trailing.equalToSuperview().inset(100)
        }
        startButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(560)
            make.leading.equalToSuperview().inset(100)
        }
    }
    
}


