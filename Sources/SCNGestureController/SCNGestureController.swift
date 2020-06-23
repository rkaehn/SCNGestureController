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
    
    private(set) lazy var tapGestureController = SCNTapGestureController()
    private(set) lazy var rotationGestureController = SCNRotationGestureController()
    private(set) lazy var panGestureController = SCNPanGestureController()
    private(set) lazy var longPressGestureController = SCNLongPressGestureController()
    
    private init() {}
    
    public func setTargetView(_ targetView: SCNView) {
        tapGestureController.targetView = targetView
        rotationGestureController.targetView = targetView
        panGestureController.targetView = targetView
        longPressGestureController.targetView = targetView
    }
}
