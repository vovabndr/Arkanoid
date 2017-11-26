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
        
//        UserDefaults.standard.set(highScore, forKey: "highScore")
//        UserDefaults.standard.value(forKey: "highScore")
//        UserDefaults.standard.object(forKey: String)
        

        if bodyA?.physicsBody?.categoryBitMask == phyBodies.botBodyMask &&
            bodyB?.physicsBody?.categoryBitMask == phyBodies.ballPhBodMask {
            ballOff()
            removeHeasrt()
            if livesScore >= 0{
            lives()
            }
            
            if livesScore == -1{
                lose()
                
            }
        }
    }
}