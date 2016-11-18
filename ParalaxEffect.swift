//
//  ParalaxEffect.swift
//  imobi
//
//  Created by Zoom-Biz on 16.09.2016.
//  Copyright © 2016 Zoom-Biz. All rights reserved.
//

import Foundation
import UIKit

class ParalaxEffect: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setParalax()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.setParalax()
    }
    
    fileprivate func setParalax() {
        // Set vertical effect
        let verticalMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis)
        verticalMotionEffect.minimumRelativeValue = -10
        verticalMotionEffect.maximumRelativeValue = 10
        
        // Set horizontal effect
        let horizontalMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
        horizontalMotionEffect.minimumRelativeValue = -10
        horizontalMotionEffect.maximumRelativeValue = 10
        
        // Create group to combine both
        let group = UIMotionEffectGroup()
        group.motionEffects = [horizontalMotionEffect, verticalMotionEffect]
        
        // Add both effects to your view
        self.addMotionEffect(group)
    }
}
