//
//  SCNLongPressGestureController.swift
//  supergraphSK
//
//  Created by Raffael Kaehn on 22.06.20.
//  Copyright © 2020 Raffael Kaehn. All rights reserved.
//

import SceneKit
#if os(macOS)
import Cocoa
#else
import UIKit
#endif

#if os(macOS)
public typealias UniversalLongPressGestureHandler = SCNGestureHandler<NSPressGestureRecognizer, SCNLongPressGesture>
#else
public typealias UniversalLongPressGestureHandler = SCNGestureHandler<UILongPressGestureRecognizer, SCNLongPressGesture>
#endif

public class SCNLongPressGestureController: UniversalLongPressGestureHandler {
    @objc override func handleGesture() {
        let location = gesture.location(in: targetView)
        let state = gesture.state
        let longPressGesture = SCNLongPressGesture(position: location, state: state)

        if let node = targetView.nearestNode(at: location, containedIn: Array(actions.keys)) {
            actions[node]?.forEach { $0(longPressGesture) }
        } else {
            targetViewActions.forEach { $0(longPressGesture) }
        }
    }
}
