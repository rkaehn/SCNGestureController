//
//  SCNGestureHandler.swift
//  supergraphSK
//
//  Created by Raffael Kaehn on 10.06.20.
//  Copyright © 2020 Raffael Kaehn. All rights reserved.
//

import SceneKit

#if os(macOS)
public typealias UniversalGestureRecognizer = NSGestureRecognizer
#else
public typealias UniversalGestureRecognizer = UIGestureRecognizer
#endif

public class SCNGestureHandler<GestureRecognizer, Gesture> where GestureRecognizer: UniversalGestureRecognizer, Gesture: SCNGesture {
    public lazy var gesture = GestureRecognizer(target: self, action: #selector(handleGesture))
    
    public var targetView: SCNView!
    
    var actions: [SCNNode : [(Gesture) -> Void]] = [:]
    var targetViewActions: [(Gesture) -> Void] = []
    
    @objc func handleGesture() {}
    
    public func addAction(scnNode: SCNNode? = nil, action: @escaping (Gesture) -> Void) {
        if actions.isEmpty && targetViewActions.isEmpty {
            targetView.addGestureRecognizer(gesture)
        }
        
        if let node = scnNode {
            if let currentActions = actions[node] {
                actions[node] = currentActions + [action]
            } else {
                actions[node] = [action]
            }
        } else {
            targetViewActions.append(action)
        }
    }
    
    public func removeActions(scnNode: SCNNode? = nil) {
        if let node = scnNode {
            actions[node] = []
        } else {
            targetViewActions = []
        }
        
        if actions.isEmpty && targetViewActions.isEmpty {
            targetView.removeGestureRecognizer(gesture)
        }
    }
}
