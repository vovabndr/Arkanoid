//
//  RulesViewController.swift
//  arkanoidTest
//
//  Created by Владимир Бондарь on 11/28/17.
//  Copyright © 2017 vbbv. All rights reserved.
//

import Foundation
import UIKit

class RulesViewController : UIViewController{
    
 
    let myLabel = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        myLabel.frame = CGRect(x: 50, y: 1000, width: 300, height: 500)
        myLabel.center = view.center
        myLabel.text = " \t Arkanoid ( Arukanoido) is an arcade game released by Taito in 1986. It expanded upon Atari's Breakout games of the 1970s by adding power-ups, different types of bricks, a variety of level layouts, and visual layering and depth. The title refers to a doomed mother ship from which the player's ship, the Vaus, escapes. It was widely ported to contemporary systems and followed by a series of remakes and sequels, including the 1987 arcade game Arkanoid: Revenge of Doh. Arkanoid revived the Breakout concept, resulting in many clones and similar games for home computers, even over a decade later. \n \t The player controls the Vaus, a space vessel that acts as the game's paddle which prevents a ball from falling from the playing field, attempting to bounce it against a number of bricks. The ball striking a brick causes the brick to disappear. When all the bricks are gone, the player goes to the next level, where another pattern of bricks appears."
        myLabel.textColor = .white
        myLabel.numberOfLines = 0
        myLabel.lineBreakMode = .byWordWrapping
        
        myLabel.adjustsFontSizeToFitWidth = true
        myLabel.sizeToFit()
        view.addSubview(myLabel)
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        Sound.play(file:"button_press.wav")
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
