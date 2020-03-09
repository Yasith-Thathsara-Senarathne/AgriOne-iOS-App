//
//  PDFCreator.swift
//  AgriOne App
//
//  Created by Yasith Thathsara Senarathne on 3/9/20.
//  Copyright © 2020 Yasith Thathsara Senarathne. All rights reserved.
//

import UIKit
import PDFKit

class PDFCreator:NSObject {
    let title: String
    let image: UIImage
    
    init(title: String, image: UIImage) {
        self.title = title
        self.image = image
    }
    
    func createFlyer() -> Data {
        // 1
        let pdfMetaData = [
            kCGPDFContextCreator: "Flyer Builder",
            kCGPDFContextAuthor: "raywenderlich.com",
            kCGPDFContextTitle: title
        ]
        let format = UIGraphicsPDFRendererFormat()
        format.documentInfo = pdfMetaData as [String: Any]
        
        // 2
        let pageWidth = 8.5 * 72.0
        let pageHeight = 11 * 72.0
        let pageRect = CGRect(x: 0, y: 0, width: pageWidth, height: pageHeight)
        
        // 3
        let renderer = UIGraphicsPDFRenderer(bounds: pageRect, format: format)
        // 4
        let data = renderer.pdfData { (context) in
            // 5
            context.beginPage()
            // 6
            let titleBottom = addTitle(pageRect: pageRect)
            let imageBottom = addImage(pageRect: pageRect, imageTop: titleBottom + 18.0)
            addBodyText(pageRect: pageRect, textTop: imageBottom + 18.0)
        }
        
        return data
    }
    
    func addTitle(pageRect: CGRect) -> CGFloat {
        // 1
        let titleFont = UIFont.systemFont(ofSize: 18.0, weight: .bold)
        // 2
        let titleAttributes: [NSAttributedString.Key: Any] =
            [NSAttributedString.Key.font: titleFont]
        let attributedTitle = NSAttributedString(string: title, attributes: titleAttributes)
        // 3
        let titleStringSize = attributedTitle.size()
        // 4
        let titleStringRect = CGRect(x: (pageRect.width - titleStringSize.width) / 2.0,
                                     y: 36, width: titleStringSize.width,
                                     height: titleStringSize.height)
        // 5
        attributedTitle.draw(in: titleStringRect)
        // 6
        return titleStringRect.origin.y + titleStringRect.size.height
    }
    
    func addBodyText(pageRect: CGRect, textTop: CGFloat) {
        // 1
        let textFont = UIFont.systemFont(ofSize: 12.0, weight: .regular)
        // 2
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .natural
        paragraphStyle.lineBreakMode = .byWordWrapping
        // 3
        let textAttributes = [
            NSAttributedString.Key.paragraphStyle: paragraphStyle,
            NSAttributedString.Key.font: textFont
        ]
    }
    
    func addImage(pageRect: CGRect, imageTop: CGFloat) -> CGFloat {
        // 1
        let maxHeight = pageRect.height * 0.4
        let maxWidth = pageRect.width * 0.8
        // 2
        let aspectWidth = maxWidth / image.size.width
        let aspectHeight = maxHeight / image.size.height
        let aspectRatio = min(aspectWidth, aspectHeight)
        // 3
        let scaledWidth = image.size.width * aspectRatio
        let scaledHeight = image.size.height * aspectRatio
        // 4
        let imageX = (pageRect.width - scaledWidth) / 2.0
        let imageRect = CGRect(x: imageX, y: imageTop,
                               width: scaledWidth, height: scaledHeight)
        // 5
        image.draw(in: imageRect)
        return imageRect.origin.y + imageRect.size.height
    }
}
