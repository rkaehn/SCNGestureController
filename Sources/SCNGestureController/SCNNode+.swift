//
//  SCNNode+.swift
//  supergraphSK
//
//  Created by Raffael Kaehn on 11.06.20.
//  Copyright © 2020 Raffael Kaehn. All rights reserved.
//

import SceneKit

extension SCNNode {
    public func onTap(_ action: @escaping (SCNTapGesture) -> Void) {
        SCNGestureController.shared.tapGestureController.addAction(scnNode: self, action: action)
    }
    
    public func onRotation(_ action: @escaping (SCNRotationGesture) -> Void) {
        SCNGestureController.shared.rotationGestureController.addAction(scnNode: self, action: action)
    }
    
    public func onPan(_ action: @escaping (SCNPanGesture) -> Void) {
        SCNGestureController.shared.panGestureController.addAction(scnNode: self, action: action)
    }
    
    public func onLongPress(_ action: @escaping (SCNLongPressGesture) -> Void) {
        SCNGestureController.shared.longPressGestureController.addAction(scnNode: self, action: action)
    }
    
    public func onPinch(_ action: @escaping (SCNPinchGesture) -> Void) {
        SCNGestureController.shared.pinchGestureController.addAction(scnNode: self, action: action)
    }
}
