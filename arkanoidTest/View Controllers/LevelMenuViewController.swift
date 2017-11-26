//
//  LevelMenuViewController.swift
//  arkanoidTest
//
//  Created by Владимир Бондарь on 11/25/17.
//  Copyright © 2017 vbbv. All rights reserved.
//

import UIKit
class levelMenuViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        Sound.play(file:"button_press.wav")
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func levelChoosingButton(_ sender: UIButton) {
        Sound.play(file:"button_press.wav")

        
        if let storyboard = storyboard{
            let GameViewController = storyboard.instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
            navigationController?.pushViewController(GameViewController, animated: true)
        }
        
    }
    
    
}
