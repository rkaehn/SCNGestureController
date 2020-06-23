//
//  SCNRotationGestureController.swift
//  supergraphSK
//
//  Created by Raffael Kaehn on 20.06.20.
//  Copyright © 2020 Raffael Kaehn. All rights reserved.
//

import SceneKit
#if os(macOS)
import Cocoa
#else
import UIKit
#endif

#if os(macOS)
public typealias UniversalRotationGestureHandler = SCNGestureHandler<NSRotationGestureRecognizer, SCNRotationGesture>
#else
public typealias UniversalRotationGestureHandler = SCNGestureHandler<UIRotationGestureRecognizer, SCNRotationGesture>
#endif

public class SCNRotationGestureController: UniversalRotationGestureHandler {
    private var targetNode: SCNNode?
    
    @objc override func handleGesture() {
        let location = gesture.location(in: targetView)
        let angle = Measurement<UnitAngle>(value: Double(gesture.rotation), unit: .radians)
        let state = gesture.state
        let rotationGesture = SCNRotationGesture(position: location, angle: angle, state: state)
        
        if gesture.state == .began {
            targetNode = targetView.nearestNode(at: location, containedIn: Array(actions.keys))
        }
        
        if let targetNode = targetNode {
            actions[targetNode]?.forEach { $0(rotationGesture) }
        } else {
            if !targetViewActions.isEmpty {
                targetViewActions.forEach { $0(rotationGesture) }
            } else {
                gesture.state = .failed
            }
        }
        
        switch gesture.state {
        case .cancelled, .ended, .failed:
            targetNode = nil
        default:
            return
        }
    }
}
