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
            paddleNode.position.x = touchLoc.x
        }
        
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
            let touchLoc = touch.location(in: self)
            paddleNode.position.x = touchLoc.x
        }
    }
}
