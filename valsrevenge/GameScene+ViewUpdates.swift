//
//  GameScene+ViewUpdates.swift
//  valsrevenge
//
//  Created by user on 2023/5/19.
//

import SpriteKit

protocol GameViewControllerDelegate {
  func didChangeLayout()
}

extension GameScene: GameViewControllerDelegate {
    
    func didChangeLayout() {
        let w = view?.bounds.size.width ?? 1024
        let h = view?.bounds.size.height ?? 1336
        
        if h >= w { // portrait, which matches the design
            camera?.setScale(1.0)
        } else {
            camera?.setScale(1.25) // helps to keep relative size
            // larger numbers results in "smaller" scenes
        }
    }
}
