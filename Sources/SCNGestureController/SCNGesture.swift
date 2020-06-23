//
//  SCNGesture.swift
//  supergraphSK
//
//  Created by Raffael Kaehn on 20.06.20.
//  Copyright © 2020 Raffael Kaehn. All rights reserved.
//

import Foundation
import SceneKit

#if os(macOS)
public typealias UniversalGestureState = NSGestureRecognizer.State
#else
public typealias UniversalGestureState = UIGestureRecognizer.State
#endif

public protocol SCNGesture {
    var position: CGPoint { get }
    var state: UniversalGestureState { get }
}


