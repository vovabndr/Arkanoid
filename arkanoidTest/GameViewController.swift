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

    var scene = GameScene(size: CGSize(width: 750, height: 1334) )
  
    @IBOutlet weak var reloadGameButton: UIButton!
    @IBOutlet weak var loadingView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scene.gameViewControllerBridge = self
        
        reloadGameButton.isHidden = true
        reloadGameButton.frame = CGRect(x: Int(self.view.frame.midX - 85.0/2), y: 400, width: 85, height: 75)
        
        let view = self.view as! SKView
        scene.scaleMode = .aspectFill
        
        view.ignoresSiblingOrder = true
        
        
        
        loadingView.isHidden = false
        
        let when = DispatchTime.now() + 3
        DispatchQueue.main.asyncAfter(deadline: when) {
            self.loadingView.isHidden = true
            view.presentScene(self.scene)
        }
        
        
        
        
        
    }
    
    @IBAction func refreshGameButton(_ sender: UIButton) {
        
        scene.reloadGame()
        self.reloadGameButton.isHidden = true
    }
    
    
    override var shouldAutorotate: Bool {
        return true
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
