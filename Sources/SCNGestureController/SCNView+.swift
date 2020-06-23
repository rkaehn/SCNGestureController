//
//  SCNView.swift
//  supergraphSK
//
//  Created by Raffael Kaehn on 20.06.20.
//  Copyright © 2020 Raffael Kaehn. All rights reserved.
//

import Foundation
import SceneKit

extension SCNView {
    func nodes(at position: CGPoint) -> [SCNNode]? {
        let hitTestResult = self.hitTest(position, options: [SCNHitTestOption.searchMode : 1,
                                                                   SCNHitTestOption.ignoreHiddenNodes : true])
        if !hitTestResult.isEmpty {
            return hitTestResult.map { $0.node }
        } else {
            return nil
        }
    }
    
    func nearestNode(at position: CGPoint, containedIn targets: [SCNNode]) -> SCNNode? {
        if let nodes = self.nodes(at: position) {
            for node in nodes {
                if let hitTargetNode = targets.filter({ $0 == node || $0.childNodes.contains(node) }).first {
                    return hitTargetNode
                }
            }
        }
        return nil
    }
}

extension SCNView {
    public func onTap(_ action: @escaping (SCNTapGesture) -> Void) {
        SCNGestureController.shared.tapGestureController.addAction(action: action)
    }
    
    public func onRotation(_ action: @escaping (SCNRotationGesture) -> Void) {
        SCNGestureController.shared.rotationGestureController.addAction(action: action)
    }
    
    public func onPan(_ action: @escaping (SCNPanGesture) -> Void) {
        SCNGestureController.shared.panGestureController.addAction(action: action)
    }
    
    public func onLongPress(_ action: @escaping (SCNLongPressGesture) -> Void) {
        SCNGestureController.shared.longPressGestureController.addAction(action: action)
    }
    
    public func onPinch(_ action: @escaping (SCNPinchGesture) -> Void) {
        SCNGestureController.shared.pinchGestureController.addAction(action: action)
    }
}
