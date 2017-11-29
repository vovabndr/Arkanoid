//
//  GameScene_Touches.swift
//  arkanoidTest
//
//  Created by Владимир Бондарь on 11/21/17.
//  Copyright © 2017 vbbv. All rights reserved.
//

import Foundation
import SpriteKit

extension GameScene{
   
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
            
            let touchLoc = touch.location(in: self)
            
            if (touchLoc.y<1150){

            if ballNode.physicsBody == nil{
                ballOn()}
                if (self.scene?.isPaused == false){
            if (loseStatus == false ){
            if (touchLoc.x > self.frame.maxX - paddleNode.size.width/2){
                paddleNode.position.x = self.frame.maxX - paddleNode.size.width/2
            }else if (touchLoc.x < self.frame.minX + paddleNode.size.width/2){
                paddleNode.position.x = self.frame.minX + paddleNode.size.width/2
            } else {
                paddleNode.position.x = touchLoc.x}
                }
            }
            }
        }
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
            let touchLoc = touch.location(in: self)
            


            if (touchLoc.y<1150){

            if ballNode.physicsBody == nil{
                ballOn()}
                if (self.scene?.isPaused == false){
            if (loseStatus == false  ){
            if (touchLoc.x > self.frame.maxX - paddleNode.size.width/2){
                paddleNode.position.x = self.frame.maxX - paddleNode.size.width/2
            }else if (touchLoc.x < self.frame.minX + paddleNode.size.width/2){
                paddleNode.position.x = self.frame.minX + paddleNode.size.width/2
            } else {
                paddleNode.position.x = touchLoc.x}
            }
            }
        }
        }
    }
}
