//
//  SCNLongPressGesture.swift
//  supergraphSK
//
//  Created by Raffael Kaehn on 22.06.20.
//  Copyright © 2020 Raffael Kaehn. All rights reserved.
//

import SceneKit

public struct SCNLongPressGesture: SCNGesture {
    public let position: CGPoint
    public let state: UniversalGestureState
}
