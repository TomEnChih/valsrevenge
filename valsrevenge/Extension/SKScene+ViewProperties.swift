//
//  SKScene+ViewProperties.swift
//  valsrevenge
//
//  Created by user on 2023/5/19.
//

import SpriteKit
import UIKit

extension SKScene {
    
    var viewTop: CGFloat {
        return convertPoint(fromView: .init(x: 0.0, y: 0)).y
    }
    
    var viewBottom: CGFloat {
        guard let view = view else { return 0.0 }
        return convertPoint(fromView: .init(x: 0.0, y: view.bounds.size.height)).y
    }
    
    var viewLeft: CGFloat {
        return convertPoint(fromView: .init(x: 0, y: 0.0)).x
    }
    
    var viewRight: CGFloat {
        guard let view = view else { return 0.0 }
        return convertPoint(fromView: .init(x: view.bounds.size.width, y: 0.0)).x
    }
    
    var insets: UIEdgeInsets {
        return UIApplication
            .shared
            .connectedScenes
            .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
            .first { $0.isKeyWindow }?
            .safeAreaInsets ?? .zero
    }
}
