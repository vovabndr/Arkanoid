//
//  MainViewController .swift
//  arkanoidTest
//
//  Created by Владимир Бондарь on 11/25/17.
//  Copyright © 2017 vbbv. All rights reserved.
//

import SpriteKit
import UIKit



class MainViewController: UIViewController{
    

    override func viewDidLoad() {
         super.viewDidLoad()
        

    }
    
    @IBAction func startGAme(sender: UIButton){
        Sound.play(file:"button_press.wav")
      
        if let storyboard = storyboard{
            let levelMenuViewController = storyboard.instantiateViewController(withIdentifier: "levelMenuViewController") as! levelMenuViewController
            navigationController?.pushViewController(levelMenuViewController, animated: true)
        }
        
    }
    
}

