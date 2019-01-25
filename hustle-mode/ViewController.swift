//
//  ViewController.swift
//  hustle-mode
//
//  Created by Gökçe Demir on 17.01.2019.
//  Copyright © 2019 Gökçe Demir. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player : AVAudioPlayer!
    
    @IBOutlet weak var darkBlueBG: UIImageView!
    @IBOutlet weak var cloudHolder: UIView!
    @IBOutlet weak var rocket: UIImageView!
    
    @IBOutlet weak var powerBtn: UIButton!
    @IBOutlet weak var hustleLabel: UILabel!
    @IBOutlet weak var onLabel: UILabel!
    
    @IBAction func powerButton(_ sender: Any){
        cloudHolder.isHidden = false
        darkBlueBG.isHidden = true
        powerBtn.isHidden = true
        
        player.play()
        
        UIView.animate(withDuration: 2.5, animations: {
            self.rocket.frame = CGRect(x: 0, y: 220, width: 375, height: 200)
        }) { (finished) in
            self.hustleLabel.isHidden = false
            self.onLabel.isHidden = false
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource:"hustle-on",ofType:"wav")!
        let url = URL(fileURLWithPath: path)
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
        }catch let error as NSError{
            print(error.description)
        }
    }
}
