//
//  SCNPanGestureController.swift
//  supergraphSK
//
//  Created by Raffael Kaehn on 21.06.20.
//  Copyright © 2020 Raffael Kaehn. All rights reserved.
//

import SceneKit
#if os(macOS)
import Cocoa
#else
import UIKit
#endif

#if os(macOS)
public typealias UniversalPanGestureHandler = SCNGestureHandler<NSPanGestureRecognizer, SCNPanGesture>
#else
public typealias UniversalPanGestureHandler = SCNGestureHandler<UIPanGestureRecognizer, SCNPanGesture>
#endif

public class SCNPanGestureController: UniversalPanGestureHandler {
    private var targetNode: SCNNode?
    
    @objc override func handleGesture() {
        let location = gesture.location(in: targetView)
        let state = gesture.state
        let panGesture = SCNPanGesture(position: location, state: state)
        
        if gesture.state == .began {
            targetNode = targetView.nearestNode(at: location, containedIn: Array(actions.keys))
        }
        
        if let targetNode = targetNode {
            actions[targetNode]?.forEach { $0(panGesture) }
        } else {
            if !targetViewActions.isEmpty {
                targetViewActions.forEach { $0(panGesture) }
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

