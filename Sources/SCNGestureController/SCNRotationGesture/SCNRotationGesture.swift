//
//  SCNRotationGesture.swift
//  supergraphSK
//
//  Created by Raffael Kaehn on 10.06.20.
//  Copyright © 2020 Raffael Kaehn. All rights reserved.
//

import SceneKit

public struct SCNRotationGesture: SCNGesture {
    public let position: CGPoint
    public let angle: Measurement<UnitAngle>
    public let state: UniversalGestureState
}
