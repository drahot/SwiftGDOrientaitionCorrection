//
// Created by 堀田竜也 on 2023/06/07.
//

import Foundation

import SwiftGD
import SwiftExif

extension SwiftGD.Image {

    public func exportWithOrientationCorrection(url: URL, format: ExportableFormat) throws -> Data? {
        let imageExif = SwiftExif.Image(imagePath: url)
        let exif = imageExif.Exif()
        let orientation = exif.filter {
                    $0.value.filter {
                                $0.key == "Orientation"
                            }
                            .count > 0
                }
                .first?
                .value["Orientation"]

        let image = ImageOrientation(rawValue: orientation?.lowercased() ?? "")?.image(url: url) ?? Image(url: url)
        return try image?.export(as: format)
    }
}
