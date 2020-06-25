//
//  File.swift
//  
//
//  Created by Raffael Kaehn on 23.06.20.
//

import SceneKit
#if os(macOS)
import Cocoa
#else
import UIKit
#endif

#if os(macOS)
public typealias UniversalPinchGestureHandler = SCNGestureHandler<NSMagnificationGestureRecognizer, SCNPinchGesture>
#else
public typealias UniversalPinchGestureHandler = SCNGestureHandler<UIPinchGestureRecognizer, SCNPinchGesture>
#endif

public class SCNPinchGestureController: UniversalPinchGestureHandler {
    private var targetNode: SCNNode?
    
    @objc override func handleGesture() {
        let location = gesture.location(in: targetView)
        let state = gesture.state
        
        #if os(macOS)
        let scale = gesture.magnification > 0 ? gesture.magnification + 1 : 1 / abs(gesture.magnification - 1)
        #else
        let scale = gesture.scale
        #endif
        
        let pinchGesture = SCNPinchGesture(position: location, scale: scale, state: state)
        
        if gesture.state == .began {
            targetNode = targetView.nearestNode(at: location, containedIn: Array(actions.keys))
        }
        
        if let targetNode = targetNode {
            actions[targetNode]?.forEach { $0(pinchGesture) }
        } else {
            if !targetViewActions.isEmpty {
                targetViewActions.forEach { $0(pinchGesture) }
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
