//
//  UIImage+Processing.swift
//  MetalInstaFiltersCLone
//
//  Created by User on 27.1.2024.
//

import UIKit

public extension UIImage {
    func applyLUTFilter(_ filter: Filter, completion: @escaping (UIImage?) -> Void) {
        
        guard let device = MTLCreateSystemDefaultDevice() else {
            fatalError("Failed initializing device")
        }
        
        let context = CIContext(mtlDevice: device)
        
        DispatchQueue.main.async {
            guard let lut = filter.lut else {
                fatalError("===Shader filter must not initialized via applyFilter Method===")
            }
            guard let filter = CICubeColorGenerator(image: lut)?.filter() else {
                fatalError("===invalid Filter===")
            }
            guard let ciImage = CIImage(image: self) else {
                fatalError("No valid CIImage")
            }
            
            filter.setValue(ciImage, forKey: kCIInputImageKey)
            
            if let outputImage = filter.outputImage {
                guard
                    let cgImage = context.createCGImage(
                        outputImage,
                        from: outputImage.extent
                    )
                else { fatalError("===invalid cgImage===")
                }
                completion(UIImage(cgImage: cgImage))
            }
        }
    }
}
