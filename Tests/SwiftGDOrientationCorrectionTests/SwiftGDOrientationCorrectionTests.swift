//
// Created by 堀田竜也 on 2023/06/08.
//


import Foundation

import SwiftGD
import XCTest

@testable import SwiftGDOrientationCorrection

final class SwiftGDOrientationCorrectionTests: XCTestCase {

    func testExportWithOrientationCorrection() throws {
        let images = [
            "IMG-0052.jpg",
            "IMG-0056.jpg",
        ]
        try images.forEach {
            let url = URL(fileURLWithPath: "./Resources/\($0)")
            let image = Image(url: url)
            let data = try image?.exportWithOrientationCorrection(url: url, format: .jpg(quality: 70))
            XCTAssertNotNil(data)
        }
        let noImages = [
            "IMG-0051.png",
            "IMG-0055.png",
        ]
        try noImages.forEach {
            let url = URL(fileURLWithPath: "./Resources/\($0)")
            let image = Image(url: url)
            let data = try image?.exportWithOrientationCorrection(url: url, format: .jpg(quality: 70))
            XCTAssertNil(data)
        }
    }

}
