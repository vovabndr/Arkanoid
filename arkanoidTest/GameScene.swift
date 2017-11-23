//
//  GameScene.swift
//  arkanoidTest
//
//  Created by Владимир Бондарь on 11/20/17.
//  Copyright © 2017 vbbv. All rights reserved.
//
import SpriteKit
import GameplayKit

struct phyBodies {
    static let ballPhBodMask: UInt32 = 1
    static let brickPhBodMask: UInt32 = 2
    static let botBodyMask: UInt32 = 3
}

class GameScene: SKScene, SKPhysicsContactDelegate {
    //Texture
    var brickTexture = [Int:SKTexture]()
    var paddleTexture = SKTexture()
    var ballTexture = SKTexture()
    //Sprite Nodes
    var brickNode: [SKSpriteNode] = [];
    var paddleNode = SKSpriteNode()
    var ballNode = SKSpriteNode()
    let bot = SKSpriteNode()
    let top = SKSpriteNode()

    //Physic
    var border = SKPhysicsBody()


    //Label
    var labelScore = SKLabelNode()
    var label = SKLabelNode()


    //Variables
    var gameViewControllerBridge: GameViewController?
    
    
    
    var pos = CGPoint()
    var score = 0
    
    override func didMove(to view: SKView) {
        self.backgroundColor = .white
        self.physicsWorld.contactDelegate = self
       
        createObjects()
    }
    
    
    
    func createObjects(){
        createBorder()
        createBall()
        createPaddle()
        createBricks()
        brickScore()
    }
    
    
    func createBall(){
        ballTexture = SKTexture(imageNamed: "ballBlue")
        ballNode = SKSpriteNode(texture: ballTexture)
        ballNode.position = CGPoint(x: self.size.width/2,y: 95)
        ballNode.size = CGSize(width: 50, height: 50)
        ballNode.color = .black
        addChild(ballNode)
        ballNode.physicsBody = SKPhysicsBody(circleOfRadius: max(ballNode.size.width / 2,
                                                                 ballNode.size.height / 2))
        ballNode.physicsBody?.applyImpulse(CGVector(dx: 50, dy: 50))
        ballNode.physicsBody?.isDynamic = true
        ballNode.physicsBody?.allowsRotation = false
        ballNode.physicsBody?.pinned = false
        ballNode.physicsBody?.affectedByGravity = false
        ballNode.physicsBody?.mass = 1.0
        ballNode.physicsBody?.friction = 0.0
        ballNode.physicsBody?.restitution = 1.0
        ballNode.physicsBody?.linearDamping = 0.0
        ballNode.physicsBody?.angularDamping = 0.0
        ballNode.physicsBody?.categoryBitMask = phyBodies.ballPhBodMask
        ballNode.physicsBody?.collisionBitMask = 2
        ballNode.physicsBody?.contactTestBitMask = 2
    }
    
    func createPaddle(){
        paddleTexture = SKTexture(imageNamed: "paddleBlu")
        paddleNode = SKSpriteNode(texture: paddleTexture)
        paddleNode.position = CGPoint(x: self.size.width/2, y: 50)
        paddleNode.size = CGSize(width: 200, height: 40)
        addChild(paddleNode)
        
        paddleNode.physicsBody = SKPhysicsBody(texture: paddleTexture,size:
            CGSize(width: paddleNode.size.width,height: paddleNode.size.height))
        
        paddleNode.physicsBody?.isDynamic = false
        paddleNode.physicsBody?.allowsRotation = false
        paddleNode.physicsBody?.pinned = false
        paddleNode.physicsBody?.affectedByGravity = false
        paddleNode.physicsBody?.mass = 1.0
        paddleNode.physicsBody?.friction = 0.0
        paddleNode.physicsBody?.restitution = 0.0
        paddleNode.physicsBody?.linearDamping = 0.1
        paddleNode.physicsBody?.angularDamping = 0.1
    }
    
    func createBricks(){
        brickTexture = [0:SKTexture(imageNamed: "rectYellow"),
                        1:SKTexture(imageNamed: "rectRed"),
                        2:SKTexture(imageNamed: "rectPurp"),
                        3:SKTexture(imageNamed: "rectGreen"),
                        4:SKTexture(imageNamed: "rectBlue")]
         pos = CGPoint(x:120,y:1150)
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
                brickNode[i].position = CGPoint(x: Int(pos.x)+130*(i-5),y:Int(pos.y-80))
                brickNode[i].texture = brickTexture[1]}
            if (i<15 && i>9){
                brickNode[i].position = CGPoint(x: Int(pos.x)+130*(i-10),y:Int(pos.y-160))
                brickNode[i].texture = brickTexture[2]}
            if (i<20 && i>14){
                brickNode[i].position = CGPoint(x:Int(pos.x)+130*(i-15),y:Int(pos.y-240))
                brickNode[i].texture = brickTexture[3]}
            if (i<25 && i>19){
                brickNode[i].position = CGPoint(x:Int(pos.x)+130*(i-20),y:Int(pos.y-320))
                brickNode[i].texture = brickTexture[4]}
            self.addChild(brickNode[i])
        }
    }

    func lose(){
        label = SKLabelNode(text: "You are lose")
        label.position = CGPoint(x: 350, y: 600)
        label.fontSize = CGFloat(100)
        label.fontColor = .black
        self.addChild(label)
        ballNode.physicsBody?.isDynamic = false
//        gameViewControllerBridge?.pr()
        
        
    }
   
    
    func createBorder(){

        border = SKPhysicsBody(edgeLoopFrom: (self.view?.scene?.frame)!)
        self.physicsBody = border
        border.friction = 0
        
        bot.position = CGPoint(x: 0, y: 1)
        
        bot.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.frame.maxX*2, height: 1))
        bot.physicsBody?.isDynamic = false
        bot.physicsBody?.categoryBitMask = phyBodies.botBodyMask
        self.addChild(bot)
        
        top.position = CGPoint(x: 0, y: 1260)
        
        top.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.frame.maxX*2, height: 1))
        top.physicsBody?.isDynamic = false
        self.addChild(top)
    }
    func brickScore(){ 

        labelScore.text = "Score: \(score)"
        labelScore.position = CGPoint(x: 650, y: 1300)
        labelScore.fontSize = CGFloat(40)
        labelScore.fontColor = .black
        self.addChild(labelScore)
    }
    
    
    func reloadGame(){
        self.removeAllChildren()
        ballNode.speed = 1
        self.speed = 1
        
        createObjects()
    }

}



