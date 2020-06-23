//
//  SCNTapGestureController.swift
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
public typealias UniversalTapGestureHandler = SCNGestureHandler<NSClickGestureRecognizer, SCNTapGesture>
#else
public typealias UniversalTapGestureHandler = SCNGestureHandler<UITapGestureRecognizer, SCNTapGesture>
#endif

public class SCNTapGestureController: UniversalTapGestureHandler {
    @objc override func handleGesture() {
        let location = gesture.location(in: targetView)
        let state = gesture.state
        let tapGesture = SCNTapGesture(position: location, state: state)

        if let node = targetView.nearestNode(at: location, containedIn: Array(actions.keys)) {
            actions[node]?.forEach { $0(tapGesture) }
        } else {
            targetViewActions.forEach { $0(tapGesture) }
        }
    }
}
