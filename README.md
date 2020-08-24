# SCNGestureController

[![swift version](https://img.shields.io/badge/swift-5.2+-brightgreen.svg)](https://swift.org/download)
[![platforms](https://img.shields.io/badge/platforms-%20macOS%20-brightgreen.svg)](#)
[![platforms](https://img.shields.io/badge/platforms-%20iOS%20-brightgreen.svg)](#)

This package makes it extremely fast and easy to add gestures to your SceneKit project. Gestures can be added to a SCNView or SCNNode and work on iOS and macOS.

## 🚀 Getting Started

These instructions will get you up and running in no time!

### 📋 Prerequisites

* [Swift Package Manager (SPM)](https://github.com/apple/swift-package-manager)

### 💻 Installation

This package is available for iOS 12 or newer and macOS 10.13 or newer and can be installed easily via Swift Package Manager.

Just extend your `Package.swift` file with the following lines:

```swift
dependencies: [
    .package(url: "https://github.com/rkaehn/SCNGestureController", .upToNextMajor(from: "1.0.0"))
]
```

## 📝 Code Examples

Before you can use the gestures, you need to attach the gesture controller to your SCNView. This can be done with the following lines of code:
```swift
import SCNGestureController

let gestureController = SCNGestureController.shared
gestureController.setTargetView(sceneView)
```

That was it! Now you can add a gesture to a SCNNode like this:
```swift
let box = SCNNode(geometry: SCNBox())

box.onTap { (tapGesture) in
    print("Box tapped!")
}
```

You can also use the state of the gesture like this:
```swift
box.onRotation { (rotationGesture) in
    switch rotationGesture.state {
    case .began, .changed:
        print(rotationGesture.angle)
    default:
        return
    }
}
```
