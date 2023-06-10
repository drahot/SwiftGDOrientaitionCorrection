//
// Created by 堀田竜也 on 2023/06/10.
//

import Foundation

import SwiftGD
import XCTest

@testable import SwiftGDOrientationCorrection

final class ImageOrientationTests: XCTestCase {

    func testImageOrientation() throws {
        let lowerValidOrientations = [
            "top-left",
            "top-right",
            "bottom-right",
            "bottom-left",
            "left-top",
            "right-top",
            "right-bottom",
            "right-left",
        ]
        lowerValidOrientations.forEach {
            XCTAssertNotNil(ImageOrientation(rawValue: $0))
        }
        let camelValidOrientations = [
            "Top-left",
            "Top-right",
            "Bottom-right",
            "Bottom-left",
            "Left-top",
            "Right-top",
            "Right-bottom",
            "Right-left",
        ]
        camelValidOrientations.forEach {
            XCTAssertNotNil(ImageOrientation(rawValue: $0))
        }
        lowerValidOrientations.forEach {
            XCTAssertNotNil(ImageOrientation(rawValue: $0))
        }

        let upperValidOrientations = [
            "TOP-LEFT",
            "TOP-RIGHT",
            "BOTTOM-RIGHT",
            "BOTTOM-LEFT",
            "LEFT-TOP",
            "RIGHT-TOP",
            "RIGHT-BOTTOM",
            "RIGHT-LEFT",
        ]
        upperValidOrientations.forEach {
            XCTAssertNotNil(ImageOrientation(rawValue: $0))
        }
        let inValidOrientations = [
            "topLeft",
            "topRight",
            "bottomRight",
            "bottomLeft",
            "leftTop",
            "rightTop",
            "rightBottom",
            "rightLeft",
        ]
        inValidOrientations.forEach {
            XCTAssertNil(ImageOrientation(rawValue: $0))
        }
    }
}
