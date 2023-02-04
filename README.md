# Adaptive Grid

[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FLiYanan2004%2FAdaptiveGrid%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/LiYanan2004/AdaptiveGrid)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FLiYanan2004%2FAdaptiveGrid%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/LiYanan2004/AdaptiveGrid)

An alternative Grid View for old platforms.

If your minimum deployment target is lower than iOS 16, macOS 11, watchOS 9 or tvOS 16, you may need to use `AdaptiveGrid` as to support older platforms.

Otherwise, go ahead and use SwiftUI’s built in `Grid`.

## Platforms

* iOS 14.0+
* macOS 11.0+
* tvOS 14.0+
* watchOS 7.0+

## Getting Started

It’s similar to SwiftUI’s native `Grid`, so you can quickly gettting started.

```swift
AdaptiveGrid {
    GridRowContainer {
        GridCellContainer {
            Text("Hello")
        }
        GridCellContainer {
            Image(systemName: "globe")
        }
    }
    
    GridRowContainer {
        GridCellContainer {
            Image(systemName: "hand.wave")
        }
        GridCellContainer {
            Text("World")
        }
    }
}
```

![](Images/hello-world.png)

You can specify both horizontal and vertical spacing just like how you use the SwiftUI’s native `Grid` view.

```swift
AdaptiveGrid(horizontalSpacing: 10, verticalSpacing: 10) {
    ...
}
```

If you want to add dividers as row seperators, specify `showDivider` to `true`.

```swift
AdaptiveGrid(showDivider: true) {
    ...
}
```

## Note

Currently, Adaptive Grid **takes the maximum space horizontally**, which is the same with SwiftUI’s built-in `Grid` with Dividers added, so you may need to specify a `width` or `maxWidth` manually to control the size.
