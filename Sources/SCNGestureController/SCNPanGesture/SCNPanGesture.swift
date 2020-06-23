//
//  SCNPanGesture.swift
//  supergraphSK
//
//  Created by Raffael Kaehn on 21.06.20.
//  Copyright © 2020 Raffael Kaehn. All rights reserved.
//

import SceneKit

public struct SCNPanGesture: SCNGesture {
    public let position: CGPoint
    public let state: UniversalGestureState
}
