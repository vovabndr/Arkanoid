//
//  GameViewController.swift
//  arkanoidTest
//
//  Created by Владимир Бондарь on 11/20/17.
//  Copyright © 2017 vbbv. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    var levelGVC: levelChoosing!
    var scene = GameScene(size: CGSize(width: 750, height: 1334) )
  
    @IBOutlet weak var reloadGameButton: UIButton!
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var menuButton: UIButton!
    
    @IBOutlet weak var pauseButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SwiftSpinner.show(title: "Loading...", animated: true)
        scene.gameViewControllerBridge = self
        reloadGameButton.isHidden = true
        reloadGameButton.frame = CGRect(x: Int(self.view.frame.midX - 85.0/2), y: 400, width: 85, height: 75)
        menuButton.isHidden = true
        menuButton.frame = CGRect(x: Int(self.view.frame.midX - 85.0/2), y: 500, width: 85, height: 75)
        let view = self.view as! SKView
        scene.scaleMode = .aspectFill
        scene.selectedLevel = levelGVC
        view.ignoresSiblingOrder = true
     //   view.showsPhysics = true
        loadingView.isHidden = false
        
        let when = DispatchTime.now() + 1
        DispatchQueue.main.asyncAfter(deadline: when) {
            SwiftSpinner.hide()
            self.loadingView.isHidden = true
            view.presentScene(self.scene)
        }
        
        
    }
    
    @IBAction func refreshGameButton(_ sender: UIButton) {
        Sound.play(file:"button_press.wav")
        scene.reloadGame()
        scene.startNewGame()
        self.reloadGameButton.isHidden = true
    }
    
    
    @IBAction func menuButton(_ sender: UIButton) {
        Sound.play(file:"button_press.wav")
        scene.reloadGame()
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func pauseButton(_ sender: UIButton) {
        Sound.play(file:"button_press.wav")
    
        scene.isPaused = !scene.isPaused
        reloadGameButton.isHidden = !reloadGameButton.isHidden
        menuButton.isHidden = !menuButton.isHidden
    }
    
    
    
    
    
    
    
    override var shouldAutorotate: Bool {
        return false
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
