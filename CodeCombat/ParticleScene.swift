//
//  ParticleScene.swift
//  iPadClient
//
//  Created by Michael Schmatz on 7/29/14.
//  Copyright (c) 2014 CodeCombat. All rights reserved.
//

import UIKit
import SpriteKit

class ParticleScene: SKScene {
  
  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
    override init(size: CGSize) {
        super.init(size: size)
        self.backgroundColor = SKColor(red: 0.15, green: 0.15, blue: 0.3, alpha: 0.15)
        let myLabel = SKLabelNode(fontNamed: "Helvetica")
        myLabel.text = "Test"
        myLabel.fontSize = 30
        myLabel.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
        self.addChild(myLabel)
    }
    
    func newExplosion(posX:CGFloat, posY:CGFloat) -> SKEmitterNode {
        let emitter:SKEmitterNode = NSKeyedUnarchiver.unarchiveObjectWithFile(NSBundle.mainBundle().pathForResource("TestParticle", ofType: "sks")!) as SKEmitterNode
        emitter.position = CGPointMake(posX, posY)
        emitter.name = "explosion"
        emitter.targetNode = self.scene
        emitter.numParticlesToEmit = 1000
        emitter.zPosition=2.0
        return emitter
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        for touch in touches {
            let location = touch.locationInNode(self)
            self.addChild(self.newExplosion(location.x, posY: location.y))
        }
    }
    
}
