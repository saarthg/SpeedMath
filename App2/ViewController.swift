//
//  ViewController.swift
//  App2
//
//  Created by Saarth Gaonkar on 7/28/20.
//  Copyright © 2020 Saarth Gaonkar. All rights reserved.
//

import UIKit
import SQLite3

class ViewController: UIViewController, UITextFieldDelegate {
    var defaults = UserDefaults.standard
    
    @IBOutlet weak var answer: UITextField!
    @IBOutlet weak var rank: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var xp: UILabel!
    @IBOutlet weak var per: UILabel!
    @IBOutlet weak var easybutton: UIButton!
    @IBOutlet weak var medbutton: UIButton!
    @IBOutlet weak var hardbutton: UIButton!
    @IBOutlet weak var question: UILabel!
    var num1:Int = 0
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var lastScore: UILabel!
    @IBOutlet weak var score: UILabel!
    var num2:Int = 0
    var score2:Int = 0
    var time = 60
    weak var timer = Timer()
    var num3:Int = 0
    var ans:Int = 0
    var quest:String = ""
    var eas:Bool = true
    var med:Bool = false
    var har:Bool = false
    var xp1:Float = 0
    var easyScore:Int = 0
    var mediumScore:Int = 0
    var hardScore:Int = 0
    var easyPlayed:Int = 0
    var mediumPlayed:Int = 0
    var hardPlayed:Int = 0
    var easyhighscore:Int = 0
    var mediumhighscore:Int = 0
    var hardhighscore:Int = 0
    @IBAction func easy(_ sender: Any) {
        if time == 60 || time == 0{
            eas = true
            med = false
            har = false
            easybutton.setTitleColor(.systemTeal, for: .normal)
            medbutton.setTitleColor(.systemBlue, for: .normal)
            hardbutton.setTitleColor(.systemBlue, for: .normal)
        }
    }
    
    @IBAction func medium(_ sender: Any) {
        if time == 60 || time == 0{
            eas = false
            med = true
            har = false
            easybutton.setTitleColor(.systemBlue, for: .normal)
            medbutton.setTitleColor(.systemTeal, for: .normal)
            hardbutton.setTitleColor(.systemBlue, for: .normal)
        }
    }
    
    @IBAction func hard(_ sender: Any) {
        if time == 60 || time == 0{
            eas = false
            med = false
            har = true
            easybutton.setTitleColor(.systemBlue, for: .normal)
            medbutton.setTitleColor(.systemBlue, for: .normal)
            hardbutton.setTitleColor(.systemTeal, for: .normal)
        }
    }
    func set(){
        num3 = Int.random(in:1...3)
        if num3==1 && eas == true{
            num1 = Int.random(in:1...50)
            num2 = Int.random(in:1...50)
            ans = num1 + num2
            quest = "What is "+String(num1)+" + "+String(num2)
        }else if num3==2 && eas == true{
            num1 = Int.random(in:1...50)
            num2 = Int.random(in:1...50)
            ans = num1 - num2
            quest = "What is "+String(num1)+" - "+String(num2)
        }else if num3==3 && eas == true{
            num1 = Int.random(in:1...10)
            num2 = Int.random(in:1...10)
            ans = num1*num2
            quest = "What is "+String(num1)+" x "+String(num2)
        }else if num3==1 && med == true{
            num1 = Int.random(in:1...100)
            num2 = Int.random(in:1...100)
            ans = num1 + num2
            quest = "What is "+String(num1)+" + "+String(num2)
        }else if num3==2 && med == true{
            num1 = Int.random(in:1...100)
            num2 = Int.random(in:1...100)
            ans = num1 - num2
            quest = "What is "+String(num1)+" - "+String(num2)
        }else if num3==3 && med == true{
            num1 = Int.random(in:1...14)
            num2 = Int.random(in:1...14)
            ans = num1*num2
            quest = "What is "+String(num1)+" x "+String(num2)
        }else if num3==1 && har == true{
            num1 = Int.random(in:1...500)
            num2 = Int.random(in:1...500)
            ans = num1 + num2
            quest = "What is "+String(num1)+" + "+String(num2)
        }else if num3==2 && har == true{
            num1 = Int.random(in:1...500)
            num2 = Int.random(in:1...500)
            ans = num1 - num2
            quest = "What is "+String(num1)+" - "+String(num2)
        }else if num3==3 && har == true{
            num1 = Int.random(in:1...20)
            num2 = Int.random(in:1...20)
            ans = num1*num2
            quest = "What is "+String(num1)+" x "+String(num2)
        }
    }
    @IBAction func play(_ sender: Any) {
        if eas==true{
            easyPlayed += 1
        }else if med==true{
            mediumPlayed += 1
        }else if har == true{
            hardPlayed += 1
        }
        if time != 0 {
            lastScore.text = String(score2)
            score2 = 0
            score.text = "0"
        }
        answer.text = ""
        set()
        time = 60
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.decreaseTimer), userInfo: nil, repeats: true)
        question.text = quest
    }
    @IBAction func submit(_ sender: Any) {
        if answer.text==String(ans) && time != 0{
            question.text = "Correct!"
            score2+=1
            score.text = String(score2)
        }else if time == 0 || time == 60{
            question.text = "Press Play to Play Again"
        }
        if time != 0{
            set()
            question.text = quest
            answer.text = ""
        }
    }
    @objc func decreaseTimer(){
        if time != 0{
            time -= 1
            timeLabel.text = String(time)
        }else{
            timer!.invalidate()
            if har == true{
                xp1 = xp1 + Float(score2)*3
                xp.text = String(xp1)
            }else if eas == true{
                xp1 = xp1 + Float(score2)
                xp.text = String(xp1)
            }else if med == true{
                xp1 = xp1 + Float(score2)*1.5
                xp.text = String(xp1)
            }
            if xp1 >= 50 && xp1 < 200{
                rank.text = "Novice"
                progressView.progress = xp1/200
                per.text = String(ceil((xp1/200)*100)) + "%"
            }else if xp1 >= 200 && xp1 < 500{
                rank.text = "Intermediate"
                progressView.progress = xp1/500
                per.text = String(ceil((xp1/500)*100)) + "%"
            }else if xp1 >= 500 && xp1 < 1000{
                rank.text = "Advanced"
                progressView.progress = xp1/1000
                per.text = String(ceil((xp1/1000)*100)) + "%"
            }else if xp1 >= 1000 && xp1 < 2000{
                rank.text = "Expert"
                progressView.progress = xp1/2000
                per.text = String(ceil((xp1/2000)*100)) + "%"
            }else if xp1 >= 2000 && xp1 < 5000{
                rank.text = "Master"
                progressView.progress = xp1/5000
                per.text = String(ceil((xp1/5000)*100)) + "%"
            }else if xp1 >= 5000 && xp1 < 10000{
                rank.text = "Grand Master"
                progressView.progress = xp1/10000
                per.text = String(ceil((xp1/10000)*100)) + "%"
            }else if xp1 >= 10000{
                rank.text = "Legend"
            }else{
                progressView.progress = xp1/50
                per.text = String(ceil((xp1/50)*100)) + "%"
            }
            if eas==true{
                easyScore += score2
            }else if med==true{
                mediumScore += score2
            }else if har==true{
                hardScore += score2
            }
            if score2 >= easyhighscore && eas==true{
                easyhighscore = score2
            }else if score2 >= mediumhighscore && med==true{
                mediumhighscore = score2
            }else if score2 >= hardhighscore && har==true{
                hardhighscore = score2
            }
            let temp = score2
            score2 = 0
            lastScore.text = String(temp)
            score.text = "0"
            defaults.set(time, forKey:"Time")
            defaults.set(temp, forKey: "Score")
            defaults.set(rank.text, forKey: "Rank")
            defaults.set(per.text, forKey: "Percentage")
            defaults.set(easyScore, forKey: "easyScore")
            defaults.set(mediumScore, forKey: "mediumScore")
            defaults.set(hardScore, forKey: "hardScore")
            defaults.set(easyPlayed, forKey: "easyPlayed")
            defaults.set(mediumPlayed, forKey: "mediumPlayed")
            defaults.set(hardPlayed, forKey: "hardPlayed")
            defaults.set(easyhighscore, forKey: "easyhighscore")
            defaults.set(mediumhighscore, forKey: "mediumhighscore")
            defaults.set(hardhighscore, forKey: "hardhighscore")
            defaults.set(progressView.progress, forKey: "Progress")
            defaults.set(xp1, forKey: "XP")

        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        answer.resignFirstResponder()
        return true
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "stats"{
            let statsview = segue.destination as! StatsViewController
            statsview.hardScore = hardScore
            statsview.easyScore = easyScore
            statsview.mediumScore = mediumScore
            statsview.hardPlayed = hardPlayed
            statsview.easyPlayed = easyPlayed
            statsview.mediumPlayed = mediumPlayed
            statsview.easyhighscore = easyhighscore
            statsview.mediumhighscore = mediumhighscore
            statsview.hardhighscore = hardhighscore
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let dscore = defaults.integer(forKey: "Score")
        lastScore.text = String(dscore)
        let dprogress = defaults.float(forKey: "Progress")
        progressView.progress = dprogress
        let dxp = defaults.float(forKey: "XP")
        xp.text = String(dxp)
        easyScore = defaults.integer(forKey: "easyScore")
        mediumScore = defaults.integer(forKey: "mediumScore")
        hardScore = defaults.integer(forKey: "hardScore")
        easyPlayed = defaults.integer(forKey: "easyPlayed")
        mediumPlayed = defaults.integer(forKey: "mediumPlayed")
        hardPlayed = defaults.integer(forKey: "hardPlayed")
        easyhighscore = defaults.integer(forKey: "easyhighscore")
        mediumhighscore = defaults.integer(forKey: "mediumhighscore")
        hardhighscore = defaults.integer(forKey: "hardhighscore")
        xp1 = defaults.float(forKey: "XP")
        if xp1 >= 50{
            rank.text = defaults.string(forKey: "Rank")
        }else{
            rank.text = "Newbie"
        }
        if xp1==0{
            per.text = "0%"
        }else{
            per.text = defaults.string(forKey: "Percentage")
        }
        time = defaults.integer(forKey:"Time")
        timeLabel.text = String(time)
        progressView.transform = progressView.transform.scaledBy(x: 1, y: 4)
        answer.delegate = self
        
        // Do any additional setup after loading the view.
    }


}

