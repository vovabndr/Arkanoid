//
//  GamwScene_creatingLevels.swift
//  arkanoidTest
//
//  Created by Владимир Бондарь on 11/27/17.
//  Copyright © 2017 vbbv. All rights reserved.
//

import SpriteKit
import UIKit


extension GameScene{
    
    func createBricks(){
        brickTexture = [0:SKTexture(imageNamed: "rectYellow"),
                        1:SKTexture(imageNamed: "rectRed"),
                        2:SKTexture(imageNamed: "rectPurp"),
                        3:SKTexture(imageNamed: "rectGreen"),
                        4:SKTexture(imageNamed: "rectBlue")]
        pos = CGPoint(x:120,y:1150)
        
        
        switch selectedLevel.rawValue{
        
        case 0:
            for i in 0...24 {
                brickNode.append(SKSpriteNode(texture: brickTexture[i%5]))
                brickNode[i].position = pos
                brickNode[i].size = CGSize(width: 120, height: 60)
                brickNode[i].physicsBody = SKPhysicsBody(rectangleOf:CGSize(
                    width: brickNode[i].size.width,
                    height: brickNode[i].size.height))
                
                brickNode[i].physicsBody?.isDynamic = false
                brickNode[i].physicsBody?.allowsRotation = false
                brickNode[i].physicsBody?.pinned = false
                brickNode[i].physicsBody?.affectedByGravity = false
                brickNode[i].physicsBody?.mass = 0.01
                brickNode[i].physicsBody?.friction = 0.2
                brickNode[i].physicsBody?.restitution = 0.2
                brickNode[i].physicsBody?.linearDamping = 0.1
                brickNode[i].physicsBody?.angularDamping = 0.1
                brickNode[i].physicsBody?.categoryBitMask = 2
                brickNode[i].physicsBody?.collisionBitMask = 1
                brickNode[i].physicsBody?.contactTestBitMask = 1
                
                if (i<5 && i>0){brickNode[i].position = CGPoint(x:Int(pos.x)+130*i,y:Int(pos.y))
                    brickNode[i].texture = brickTexture[0]}
                if (i<10 && i>4){
                    brickNode[i].position = CGPoint(x: Int(pos.x)+130*(i-5),y:Int(pos.y-70))
                    brickNode[i].texture = brickTexture[1]}
                if (i<15 && i>9){
                    brickNode[i].position = CGPoint(x: Int(pos.x)+130*(i-10),y:Int(pos.y-140))
                    brickNode[i].texture = brickTexture[2]}
                if (i<20 && i>14){
                    brickNode[i].position = CGPoint(x:Int(pos.x)+130*(i-15),y:Int(pos.y-210))
                    brickNode[i].texture = brickTexture[3]}
                if (i<25 && i>19){
                    brickNode[i].position = CGPoint(x:Int(pos.x)+130*(i-20),y:Int(pos.y-280))
                    brickNode[i].texture = brickTexture[4]}
                if(i < 15 && i > 4){
                    check += 1
                    self.addChild(brickNode[i])}
            }

        
        case 1:         for i in 0...24 {
            brickNode.append(SKSpriteNode(texture: brickTexture[i%5]))
            brickNode[i].position = pos
            brickNode[i].size = CGSize(width: 120, height: 60)
            brickNode[i].physicsBody = SKPhysicsBody(rectangleOf:CGSize(
                width: brickNode[i].size.width,
                height: brickNode[i].size.height))
            
            brickNode[i].physicsBody?.isDynamic = false
            brickNode[i].physicsBody?.allowsRotation = false
            brickNode[i].physicsBody?.pinned = false
            brickNode[i].physicsBody?.affectedByGravity = false
            brickNode[i].physicsBody?.mass = 0.01
            brickNode[i].physicsBody?.friction = 0.2
            brickNode[i].physicsBody?.restitution = 0.2
            brickNode[i].physicsBody?.linearDamping = 0.1
            brickNode[i].physicsBody?.angularDamping = 0.1
            brickNode[i].physicsBody?.categoryBitMask = 2
            brickNode[i].physicsBody?.collisionBitMask = 1
            brickNode[i].physicsBody?.contactTestBitMask = 1
            
            if (i<5 && i>0){brickNode[i].position = CGPoint(x:Int(pos.x)+130*i,y:Int(pos.y))
                brickNode[i].texture = brickTexture[0]}
            if (i<10 && i>4){
                brickNode[i].position = CGPoint(x: Int(pos.x)+130*(i-5),y:Int(pos.y-70))
                brickNode[i].texture = brickTexture[1]}
            if (i<15 && i>9){
                brickNode[i].position = CGPoint(x: Int(pos.x)+130*(i-10),y:Int(pos.y-140))
                brickNode[i].texture = brickTexture[2]}
            if (i<20 && i>14){
                brickNode[i].position = CGPoint(x:Int(pos.x)+130*(i-15),y:Int(pos.y-210))
                brickNode[i].texture = brickTexture[3]}
            if (i<25 && i>19){
                brickNode[i].position = CGPoint(x:Int(pos.x)+130*(i-20),y:Int(pos.y-280))
                brickNode[i].texture = brickTexture[4]}
           
            if (i != 0 && i != 1 && i != 3 && i != 4 && i != 5 && i != 9 && i != 15 && i != 19 && i != 20 && i != 21 && i != 12 && i != 23 && i != 24  ){
                 check += 1
                self.addChild(brickNode[i])}
            }
            
            
        
        case 2:
            for i in 0...24 {
            brickNode.append(SKSpriteNode(texture: brickTexture[i%5]))
            brickNode[i].position = pos
            brickNode[i].size = CGSize(width: 120, height: 60)
            brickNode[i].physicsBody = SKPhysicsBody(rectangleOf:CGSize(
                width: brickNode[i].size.width,
                height: brickNode[i].size.height))
            
            brickNode[i].physicsBody?.isDynamic = false
            brickNode[i].physicsBody?.allowsRotation = false
            brickNode[i].physicsBody?.pinned = false
            brickNode[i].physicsBody?.affectedByGravity = false
            brickNode[i].physicsBody?.mass = 0.01
            brickNode[i].physicsBody?.friction = 0.2
            brickNode[i].physicsBody?.restitution = 0.2
            brickNode[i].physicsBody?.linearDamping = 0.1
            brickNode[i].physicsBody?.angularDamping = 0.1
            brickNode[i].physicsBody?.categoryBitMask = 2
            brickNode[i].physicsBody?.collisionBitMask = 1
            brickNode[i].physicsBody?.contactTestBitMask = 1
            
            if (i<5 && i>0){brickNode[i].position = CGPoint(x:Int(pos.x)+130*i,y:Int(pos.y))
                brickNode[i].texture = brickTexture[0]}
            if (i<10 && i>4){
                brickNode[i].position = CGPoint(x: Int(pos.x)+130*(i-5),y:Int(pos.y-70))
                brickNode[i].texture = brickTexture[1]}
            if (i<15 && i>9){
                brickNode[i].position = CGPoint(x: Int(pos.x)+130*(i-10),y:Int(pos.y-140))
                brickNode[i].texture = brickTexture[2]}
            if (i<20 && i>14){
                brickNode[i].position = CGPoint(x:Int(pos.x)+130*(i-15),y:Int(pos.y-210))
                brickNode[i].texture = brickTexture[3]}
            if (i<25 && i>19){
                brickNode[i].position = CGPoint(x:Int(pos.x)+130*(i-20),y:Int(pos.y-280))
                brickNode[i].texture = brickTexture[4]}

                
                if(i%2==0){
                    check += 1
                    self.addChild(brickNode[i])}
                
            }
        case 3:
            for i in 0...24 {
                brickNode.append(SKSpriteNode(texture: brickTexture[i%5]))
                brickNode[i].position = pos
                brickNode[i].size = CGSize(width: 120, height: 60)
                brickNode[i].physicsBody = SKPhysicsBody(rectangleOf:CGSize(
                    width: brickNode[i].size.width,
                    height: brickNode[i].size.height))
                
                
                brickNode[i].physicsBody?.isDynamic = false
                brickNode[i].physicsBody?.allowsRotation = false
                brickNode[i].physicsBody?.pinned = false
                brickNode[i].physicsBody?.affectedByGravity = false
                brickNode[i].physicsBody?.mass = 0.01
                brickNode[i].physicsBody?.friction = 0.2
                brickNode[i].physicsBody?.restitution = 0.2
                brickNode[i].physicsBody?.linearDamping = 0.1
                brickNode[i].physicsBody?.angularDamping = 0.1
                brickNode[i].physicsBody?.categoryBitMask = 2
                brickNode[i].physicsBody?.collisionBitMask = 1
                brickNode[i].physicsBody?.contactTestBitMask = 1
                
                if (i<5 && i>0){brickNode[i].position = CGPoint(x:Int(pos.x)+130*i,y:Int(pos.y))
                    brickNode[i].texture = brickTexture[0]}
                if (i<10 && i>4){
                    brickNode[i].position = CGPoint(x: Int(pos.x)+130*(i-5),y:Int(pos.y-70))
                    brickNode[i].texture = brickTexture[1]}
                if (i<15 && i>9){
                    brickNode[i].position = CGPoint(x: Int(pos.x)+130*(i-10),y:Int(pos.y-140))
                    brickNode[i].texture = brickTexture[2]}
                if (i<20 && i>14){
                    brickNode[i].position = CGPoint(x:Int(pos.x)+130*(i-15),y:Int(pos.y-210))
                    brickNode[i].texture = brickTexture[3]}
                if (i<25 && i>19){
                    brickNode[i].position = CGPoint(x:Int(pos.x)+130*(i-20),y:Int(pos.y-280))
                    brickNode[i].texture = brickTexture[4]}
                
                check = 25
                self.addChild(brickNode[i])
            }
        
        default: break
        }
    }
}
