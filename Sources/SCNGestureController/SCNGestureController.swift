//
//  SCNGestureController.swift
//  supergraphSK
//
//  Created by Raffael Kaehn on 20.06.20.
//  Copyright © 2020 Raffael Kaehn. All rights reserved.
//

import SceneKit

public class SCNGestureController {
    public static let shared = SCNGestureController()
    
    public lazy var tapGestureController = SCNTapGestureController()
    public lazy var rotationGestureController = SCNRotationGestureController()
    public lazy var panGestureController = SCNPanGestureController()
    public lazy var longPressGestureController = SCNLongPressGestureController()
    
    private init() {}
    
    public func setTargetView(_ targetView: SCNView) {
        tapGestureController.targetView = targetView
        rotationGestureController.targetView = targetView
        panGestureController.targetView = targetView
        longPressGestureController.targetView = targetView
    }
}
