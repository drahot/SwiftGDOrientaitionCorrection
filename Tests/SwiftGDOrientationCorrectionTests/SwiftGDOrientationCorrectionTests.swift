//
// Created by 堀田竜也 on 2023/06/08.
//

import SwiftGDOrientationCorrection

import Foundation
import XCTest

final class SwiftGDOrientationCorrectionTests: XCTest {

    func testExportWithOrientationCorrection() throws {
        let images = [
            "IMG_0052.jpg",
            "IMG_0056.jpg",
        ]
        images.forEach {
            let url = URL(fileURLWithPath: "Tests/SwiftGDOrientationCorrectionTests/Resources/\($0)")
            let image = Image(url: url)
            let data = try image?.exportWithOrientationCorrection(url: url, format: .jpeg)
            XCTAssertNotNil(data)
        }
    }


}
