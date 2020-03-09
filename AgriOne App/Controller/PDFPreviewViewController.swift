//
//  PDFPreviewViewController.swift
//  AgriOne App
//
//  Created by Yasith Thathsara Senarathne on 3/9/20.
//  Copyright © 2020 Yasith Thathsara Senarathne. All rights reserved.
//

import MNkSupportUtilities
import PDFKit

class PDFPreviewVewController:MNkViewController {
    var documentData:Data?
    private var pdfView:PDFView!
    
    override func config() {
        if let data = documentData {
          pdfView.document = PDFDocument(data: data)
          pdfView.autoScales = true
        }
    }
    
    override func createViews() {
        pdfView = PDFView()
    }
    
    override func insertAndLayoutSubviews() {
        view.addSubview(pdfView)
        
        pdfView.activateLayouts(to: self.view, [.top:0,.bottom:0,.leading:0,.traling:0], true)
    }
}
