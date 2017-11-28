//
//  LevelMenuViewController.swift
//  arkanoidTest
//
//  Created by Владимир Бондарь on 11/25/17.
//  Copyright © 2017 vbbv. All rights reserved.
//

import UIKit
class levelMenuViewController: UIViewController {
    
    @IBOutlet var lvlButtons: [UIButton]!
    
    var imageView:[UIImageView] = []
   
    override func viewDidLoad() {
        super.viewDidLoad()
        if     UserDefaults.standard.object(forKey: "0") == nil{
            UserDefaults.standard.set(true, forKey: "0")
        }
        editingButtons()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        editingButtons()
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        Sound.play(file:"button_press.wav")
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func levelChoosingButton(_ sender: UIButton) {
        Sound.play(file:"button_press.wav")
        if let storyboard = storyboard{
            let GameViewController = storyboard.instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
            GameViewController.levelGVC = levelChoosing(rawValue: sender.tag)!
            navigationController?.pushViewController(GameViewController, animated: true)
        }
    }
    
 
    func editingButtons(){
        for button in lvlButtons{
            button.layer.cornerRadius = 30
            button.clipsToBounds = true
            button.contentVerticalAlignment = .top
            button.setTitle(String(button.tag + 1), for: .normal)
            if(UserDefaults.standard.object(forKey: String(button.tag)) == nil   ){
                button.backgroundColor = .gray
                button.isEnabled = false
                button.setTitleColor(.white, for: .normal)
            } else
                {
                button.backgroundColor = .orange
                button.isEnabled = true
                button.setTitleColor(.blue, for: .normal)
            }
            
            stars(sender: button)
        }
        
    }
    
    func stars(sender: UIButton){
        for i in 0...2{
            imageView.append(UIImageView(frame: CGRect(x: Int(sender.frame.minX) + 5 + 50*i,
                                                       y: Int(sender.frame.midY) - 5 , width: 40, height: 40)))
            
            if (UserDefaults.standard.object(forKey: String(sender.tag ) + "h"  ) != nil ){
            
                 Model.sharedInstance.starsFor0 = UserDefaults.standard.object(forKey: String(sender.tag ) + "h"  ) as! Int
                
                self.imageView[i + 3 * sender.tag].image = UIImage(named:"star2.png")

                
                
            }else{
            self.imageView[i + 3 * sender.tag].image = UIImage(named:"star1.png")}
            
                
                
            self.view.addSubview(imageView[i + 3 * sender.tag]) }
        }

    }

