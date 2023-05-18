//
//  Player.swift
//  valsrevenge
//
//  Created by user on 2023/5/18.
//

import SpriteKit

enum Direction: String {
    case stop
    case left
    case right
    case up
    case down
    case topLeft
    case topRight
    case bottomLeft
    case bottomRight
}

class Player: SKSpriteNode {
    
    private var currentDirection = Direction.stop
    
    func move(_ direction: Direction) {
        print("move player: \(direction.rawValue)")
        switch direction {
        case .up:
            physicsBody?.velocity = CGVector(dx: 0, dy: 100)
        case .down:
            physicsBody?.velocity = CGVector(dx: 0, dy: -100)
        case .left:
            physicsBody?.velocity = CGVector(dx: -100, dy: 0)
        case .right:
            physicsBody?.velocity = CGVector(dx: 100, dy: 0)
        case .topLeft:
            physicsBody?.velocity = CGVector(dx: -100, dy: 100)
        case .topRight:
            physicsBody?.velocity = CGVector(dx: 100, dy: 100)
        case .bottomLeft:
            physicsBody?.velocity = CGVector(dx: -100, dy: -100)
        case .bottomRight:
            physicsBody?.velocity = CGVector(dx: 100, dy: -100)
        case .stop:
            stop()
        }
        
        if direction != .stop {
            currentDirection = direction
        }
    }
    
    func stop() {
        physicsBody?.velocity = CGVector(dx: 0, dy: 0)
    }
    
    func attack() {
        let projectile = SKSpriteNode(imageNamed: "knife")
        projectile.position = .init(x: 0, y: 0)
        addChild(projectile)
        
        var throwDirection = CGVector(dx: 0, dy: 0)
        
        switch currentDirection {
        case .up:
            throwDirection = CGVector(dx: 0, dy: 300)
            projectile.zRotation = 0
        case .down:
            throwDirection = CGVector(dx: 0, dy: -300)
            projectile.zRotation = -CGFloat.pi
        case .left:
            throwDirection = CGVector(dx: -300, dy: 0)
            projectile.zRotation = CGFloat.pi/2
        case .right, .stop: // default pre-movement (throw right)
            throwDirection = CGVector(dx: 300, dy: 0)
            projectile.zRotation = -CGFloat.pi/2
        case .topLeft:
            throwDirection = CGVector(dx: -300, dy: 300)
            projectile.zRotation = CGFloat.pi/4
        case .topRight:
            throwDirection = CGVector(dx: 300, dy: 300)
            projectile.zRotation = -CGFloat.pi/4
        case .bottomLeft:
            throwDirection = CGVector(dx: -300, dy: -300)
            projectile.zRotation = 3 * CGFloat.pi/4
        case .bottomRight:
            throwDirection = CGVector(dx: 300, dy: -300)
            projectile.zRotation = 3 * -CGFloat.pi/4
        }
        
        let throwProkectile = SKAction.move(by: throwDirection,
                                            duration: 0.25)
        projectile.run(throwProkectile) { projectile.removeFromParent() }
    }
}
