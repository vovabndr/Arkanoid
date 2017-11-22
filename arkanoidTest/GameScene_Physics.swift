//
//  GameScene_Physics.swift
//  arkanoidTest
//
//  Created by Владимир Бондарь on 11/21/17.
//  Copyright © 2017 vbbv. All rights reserved.
//

import Foundation
import SpriteKit

extension GameScene{
    func didBegin(_ contact: SKPhysicsContact) {
        let bodyA = contact.bodyA.node
        let bodyB = contact.bodyB.node
        
        if bodyA?.physicsBody?.categoryBitMask == phyBodies.brickPhBodMask &&
            bodyB?.physicsBody?.categoryBitMask == phyBodies.ballPhBodMask {
            bodyA?.removeFromParent()
            score += 1
            labelScore.text = "Score: \(score)"
        }
        
        

        if bodyA?.physicsBody?.categoryBitMask == phyBodies.botBodyMask &&
            bodyB?.physicsBody?.categoryBitMask == phyBodies.ballPhBodMask {
            lose()
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
//                self.scene?.isPaused = true
                self.gameViewControllerBridge?.reloadGameButton.isHidden = false
//            })
        }
        
        
    }
}
