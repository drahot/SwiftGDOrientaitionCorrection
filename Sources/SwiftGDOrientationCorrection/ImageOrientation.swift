//
// Created by 堀田竜也 on 2023/06/07.
//

import Foundation

import SwiftGD

public enum ImageOrientation: String {
    case topLeft = "top-left"
    case topRight = "top-right"
    case bottomRight = "bottom-right"
    case bottomLeft = "bottom-left"
    case leftTop = "left-top"
    case rightTop = "right-top"
    case rightBottom = "right-bottom"
    case rightLeft = "right-left"

    public init?(rawValue: String) {
        switch rawValue.lowercased() {
        case "top-left":
            self = .topLeft
        case "top-right":
            self = .topRight
        case "bottom-right":
            self = .bottomRight
        case "bottom-left":
            self = .bottomLeft
        case "left-top":
            self = .leftTop
        case "right-top":
            self = .rightTop
        case "right-bottom":
            self = .rightBottom
        case "right-left":
            self = .rightLeft
        default:
            return nil
        }
    }

    public func image(url: URL) -> Image? {
        switch self {
        case .bottomRight:
            return Image(url: url)?.rotated(Angle(degrees: 180))
        case .bottomLeft:
            return Image(url: url)?.flipped(.vertical)
        case .leftTop:
            return Image(url: url)?.rotated(Angle(degrees: 270))?.flipped(.vertical)
        case .rightTop:
            return Image(url: url)?.rotated(Angle(degrees: 270))
        case .rightBottom:
            return Image(url: url)?.rotated(Angle(degrees: 90))?.flipped(.vertical)
        case .rightLeft:
            return Image(url: url)?.rotated(Angle(degrees: 90))
        default:
            return Image(url: url)
        }
    }
}
