//
//  GameScene.swift
//  BabaIsYou-F19
//
//  Created by Parrot on 2019-10-17.
//  Copyright © 2019 Parrot. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var baba = SKSpriteNode()
    var winBlock = SKSpriteNode()
    var stopBlock = SKSpriteNode()
    var isBlock = SKSpriteNode()
    var wall = SKSpriteNode()
    var topWall = SKSpriteNode()
    var flagBlock = SKSpriteNode()
    var label = SKLabelNode()
    
    let PLAYER_SPEED:CGFloat = 10

   
    override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self
        
        
        baba = childNode(withName: "baba") as! SKSpriteNode
        
        winBlock = childNode(withName: "winblock") as! SKSpriteNode
        stopBlock = childNode(withName: "stopblock") as! SKSpriteNode
    
        isBlock = childNode(withName: "isblock") as! SKSpriteNode
        
        wall = childNode(withName: "wall") as! SKSpriteNode
        
        topWall = childNode(withName: "topwall") as! SKSpriteNode
        flagBlock = childNode(withName: "flagblock") as! SKSpriteNode
        
        
    }
   
    func didBegin(_ contact: SKPhysicsContact) {
        print("Something collided!")
        
        let nodeA = contact.bodyA.node
        let nodeB = contact.bodyB.node
        
        if(nodeA == nil || nodeB == nil){
            return
        }
        
        if(nodeA!.name == "stopblock"  && nodeB!.name == "baba"){
            
           
         print("Player collided with stop block1")
            
            
        }
        
        if(nodeA!.name == "baba"  && nodeB!.name == "stopblock"){
            
           
        }
        
        
        if(nodeA!.name == "flag" && nodeB!.name == "baba"){
            print("GAME WIN")
            
                addLabel()
//            if let scene = SKScene(fileNamed: "Level02") {
//
//                scene.scaleMode = .aspectFill
//
//                self.view?.presentScene(scene,transition: SKTransition.flipVertical(withDuration: 2.5))
//
//            }
        }
        if(nodeA!.name == "exit" && nodeB!.name == "player"){
            print("GO TO LEVEL2")
//
//            if let scene = SKScene(fileNamed: "Level02") {
//
//                scene.scaleMode = .aspectFill
//
//                self.view?.presentScene(scene,transition: SKTransition.flipVertical(withDuration: 2.5))
//
//            }
            
            
        }
        
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        
        if (stopBlock.position.y <= isBlock.position.y - 50 ){
            topWall.removeFromParent()
            
        }
        
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let mouseTouch = touches.first
        
        if(mouseTouch == nil){
            return
        }
        
        let location = mouseTouch!.location(in: self)
        let nodeTouched = atPoint(location).name
        
        
        
        if(nodeTouched == "up"){
            
            baba.position.y = baba.position.y + PLAYER_SPEED
            
        }else if (nodeTouched == "down"){
            baba.position.y = baba.position.y - PLAYER_SPEED
            
        }else if (nodeTouched == "left"){
            baba.position.x = baba.position.x - PLAYER_SPEED
            
        }else if (nodeTouched == "right"){
            baba.position.x = baba.position.x + PLAYER_SPEED
            
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    
    func addLabel() {
        label.name = "labelNivel"
        label.text = "Congratulations"
        label.fontSize = 67
        
        label.fontColor = UIColor.white
        label.position = CGPoint.zero
        label.zPosition = 11
        self.addChild(label)
    }
    
    
}
