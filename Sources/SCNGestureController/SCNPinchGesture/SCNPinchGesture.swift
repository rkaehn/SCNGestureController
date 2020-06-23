//
//  File.swift
//  
//
//  Created by Raffael Kaehn on 23.06.20.
//

import SceneKit

public struct SCNPinchGesture: SCNGesture {
    public let position: CGPoint
    public let scale: CGFloat
    public let state: UniversalGestureState
}
