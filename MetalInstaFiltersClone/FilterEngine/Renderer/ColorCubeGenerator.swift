//
//  ColorCubeGenerator.swift
//  MetalInstaFiltersCLone
//
//  Created by User on 26.1.2024.
//

import UIKit

struct CICubeColorGenerator {
    let image: UIImage
    let dimension: Int
    
    init?(image: UIImage) {
        self.image = image
                let imageWidth = self.image.size.width * self.image.scale
        let imageHeight = self.image.size.height * self.image.scale
        
        dimension = Int(cbrt(Double(imageWidth * imageHeight)))
        
        if Int(imageWidth) % dimension != 0 || Int(imageHeight) % dimension != 0 {
            assertionFailure("invalid image size")
            return nil
        }
        if (dimension * dimension * dimension) != Int(imageWidth * imageHeight) {
            assertionFailure("invalid image size")
            return nil
        }
    }
    
    /// assume all of the 3dLUT image is 8 bit depth in the RGB color space with alpha channel
    func filter() -> CIFilter? {
        
        // get image uncompressed data
        guard
            let cgImage = image.cgImage,
                let dataProvider = cgImage.dataProvider,
                let data = dataProvider.data,
            var pixels = CFDataGetBytePtr(data)
        else { return nil }

        let length = CFDataGetLength(data)
        let original = pixels
        
        let imageWidth = self.image.size.width * self.image.scale
        let imageHeight = self.image.size.height * self.image.scale
        
        let row = Int(imageHeight) / dimension
        let column = Int(imageWidth) / dimension
        
        // create cube
        var cube = UnsafeMutablePointer<Float>.allocate(capacity: length)
        let origCube = cube
        
        // transform pixels into cube
        for rowIndex in 0..<row {
            for columnIndex in 0..<column {
                /// move to next fragment
                pixels = original
                pixels += Int(imageWidth) * (rowIndex * dimension) * 4 + columnIndex * dimension * 4
                
                /// read a fragment
                for range in 0..<dimension {
                    
                    /// move to next line
                    pixels = original
                    let rowStrides = Int(imageWidth) * (rowIndex * dimension + range) * 4
                    let columnStrides = columnIndex * dimension * 4
                    pixels += (rowStrides + columnStrides)
                    
                    /// read one line
                    for _ in 0..<dimension {
                        cube.pointee = Float(pixels.pointee) / 255.0; cube += 1; pixels += 1 /// R
                        cube.pointee = Float(pixels.pointee) / 255.0; cube += 1; pixels += 1 /// G
                        cube.pointee = Float(pixels.pointee) / 255.0; cube += 1; pixels += 1 /// B
                        cube.pointee = Float(pixels.pointee) / 255.0; cube += 1; pixels += 1 /// A
                    }
                }
            }
        }
        
        let filter = CIFilter(name: "CIColorCube")!

        filter.setValue(dimension, forKey: "inputCubeDimension")
        filter.setValue(Data(bytes: origCube, count: length * 4), forKey: "inputCubeData")
        origCube.deallocate()
        return filter
    }
}
