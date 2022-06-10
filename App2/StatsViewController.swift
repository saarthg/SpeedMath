//
//  StatsViewController.swift
//  SpeedMathz
//
//  Created by Saarth Gaonkar on 8/6/20.
//  Copyright © 2020 Saarth Gaonkar. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController{
    
    @IBOutlet weak var avghard: UILabel!
    @IBOutlet weak var avgmed: UILabel!
    @IBOutlet weak var avgeasy: UILabel!
    @IBOutlet weak var higheasy: UILabel!
    @IBOutlet weak var highmedium: UILabel!
    @IBOutlet weak var highhard: UILabel!
    var easyScore:Int = 0
    var mediumScore:Int = 0
    var hardScore:Int = 0
    var easyPlayed:Int = 0
    var mediumPlayed:Int = 0
    var hardPlayed:Int = 0
    var easyhighscore:Int = 0
    var mediumhighscore:Int = 0
    var hardhighscore:Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        if easyPlayed != 0{
            avgeasy.text = String(easyScore/easyPlayed)
        }
        if mediumPlayed != 0{
            avgmed.text = String(mediumScore/mediumPlayed)
        }
        if hardPlayed != 0{
            avghard.text = String(hardScore/hardPlayed)
        }
        highmedium.text = String(easyhighscore)
        higheasy.text = String(mediumhighscore)
        highhard.text = String(hardhighscore)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
