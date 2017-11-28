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
    var heart: [SKSpriteNode] = [];

    //Physic
    var border = SKPhysicsBody()
    //Label
    var labelScore = SKLabelNode()
    var label = SKLabelNode()
    //Variables
    var gameViewControllerBridge: GameViewController?
    var pos = CGPoint()
    var score = 0
    var highScore = Int()
    var loseStatus = Bool()
    var startStatus = Bool()
    var livesScore: Int = 0
    var check = 0
//var result: Any
    
    var selectedLevel: levelChoosing!
    
    
    override func didMove(to view: SKView) {
        self.backgroundColor = .white
        self.physicsWorld.contactDelegate = self
        createObjects()
        UserDefaults.standard.set(true, forKey: "0")
    }
    
    
    
  
    func createObjects(){
        createBorder()
        createPaddle()
        createBall()
        createBricks()
        loseStatus = false
        livesScore = 2
        lives()
        
        self.gameViewControllerBridge?.pauseButton.isHidden = false
        
    }
    
    func createBall(){
        ballTexture = SKTexture(imageNamed: "ballBlue")
        ballNode = SKSpriteNode(texture: ballTexture)
        ballNode.position = CGPoint(x: self.size.width/2,y: 195)

        ballNode.size = CGSize(width: 50, height: 50)
        ballNode.color = .black
        addChild(ballNode)
        
    }
    
    func createPaddle(){
        paddleTexture = SKTexture(imageNamed: "paddleBlu")
        paddleNode = SKSpriteNode(texture: paddleTexture)
        paddleNode.position = CGPoint(x: self.size.width/2, y: 150)
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
    
   

    func lose(){
        self.gameViewControllerBridge?.reloadGameButton.isHidden = false
        self.gameViewControllerBridge?.menuButton.isHidden = false
        label = SKLabelNode(text: "You are lose")
        label.position = CGPoint(x: 350, y: 600)
        label.fontSize = CGFloat(100)
        label.fontColor = .black
        self.addChild(label)
        ballNode.physicsBody?.isDynamic = false
        ballNode.removeFromParent()
        loseStatus = true 
        
    }
    
    func win(){
        self.gameViewControllerBridge?.reloadGameButton.isHidden = false
        self.gameViewControllerBridge?.menuButton.isHidden = false
        label = SKLabelNode(text: "You win")
        label.position = CGPoint(x: 350, y: 600)
        label.fontSize = CGFloat(100)
        label.fontColor = .black
        self.addChild(label)
        ballNode.physicsBody?.isDynamic = false
        ballNode.removeFromParent()
        loseStatus = true
        
        if UserDefaults.standard.object(forKey: String(selectedLevel!.rawValue+1) ) == nil{
              UserDefaults.standard.set(true, forKey: String(selectedLevel!.rawValue+1))
        }
        
        
        if (UserDefaults.standard.object(forKey: String(selectedLevel!.rawValue) + "h"  ) == nil ){
            UserDefaults.standard.set(livesScore, forKey: String(selectedLevel!.rawValue) + "h")
        }
        
        
        if (UserDefaults.standard.object(forKey: String(selectedLevel!.rawValue) + "h"  ) != nil ){
            
            Model.sharedInstance.curr = UserDefaults.standard.value(forKey: String(selectedLevel!.rawValue) + "h") as! Int
            
            if Model.sharedInstance.curr < livesScore{
                UserDefaults.standard.set(livesScore, forKey: String(selectedLevel!.rawValue) + "h")}
        }
     
        
        
    }
    

        //        UserDefaults.standard.set(highScore, forKey: "highScore")
        //        UserDefaults.standard.value(forKey: "highScore")
        //        UserDefaults.standard.object(forKey: String)
  
   
    
    func createBorder(){

        border = SKPhysicsBody(edgeLoopFrom: (self.view?.scene?.frame)!)
        self.physicsBody = border
        border.friction = 0
        
        bot.position = CGPoint(x: 0, y: 1)
        
        bot.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.frame.maxX*2, height: 1))
        bot.physicsBody?.isDynamic = false
        bot.physicsBody?.categoryBitMask = phyBodies.botBodyMask
        self.addChild(bot)
        
        top.position = CGPoint(x: 0, y: 1250)
        
        top.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.frame.maxX*2, height: 1))
        top.physicsBody?.isDynamic = false
        self.addChild(top)
    }
    

    
    func lives(){
        
        for i in  0...livesScore{
            heart.append(SKSpriteNode(imageNamed: "heart"))
            heart[i].position = CGPoint(x: 520 + 70*i, y: 1290)
            heart[i].size = CGSize(width: 60, height: 60)
            self.addChild(heart[i])
        }
        
    }
    
    func removeHeasrt(){
        for i in 0..<heart.count{
        heart[i].removeFromParent()
        }
    }
  

    func ballOn(){
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
    
    func ballOff(){
        ballNode.physicsBody = nil
        ballNode.position = CGPoint(x: paddleNode.position.x, y: 195)
        livesScore -= 1 
    }
    
    
    func reloadGame(){
        self.gameViewControllerBridge?.menuButton.isHidden = true
        self.removeAllChildren()
        scene?.isPaused = false
    }
    
    
    func startNewGame(){
        createObjects()
    }

}



