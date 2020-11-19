//
//  EntranceViewController.swift
//  SFSafariRichTextWebKitLinking
//
//  Created by Jerry Ren on 11/18/20.
//

import UIKit

final class EntranceViewController: UIViewController {
    
    let targetDataStr = GloballyApplied.mockableChunkOfText
    @IBOutlet var txtV: UITextView!
    
        override func viewDidLoad() {
            super.viewDidLoad()
            print(GloballyApplied.mockableChunkOfText.count)
            txtVappearance()
            detectorMethod(targetData: targetDataStr)
        }
    
    private func txtVattributedSetup(flexibleRange: NSRange) {
        let mockableChunk = GloballyApplied.mockableChunkOfText
        let mutatedAttributed = NSMutableAttributedString(string: mockableChunk)
        mutatedAttributed.addAttribute(.link, value: GloballyApplied.gitHubWebsiteLink, range: flexibleRange)
        mutatedAttributed.addAttributes([.font : UIFont(name: GloballyApplied.personallyPreferredFont, size: 16)], range: NSRange(location: 0, length: mockableChunk.count - 1))
        self.txtV.attributedText = mutatedAttributed
    }
      
    private func txtVappearance() {
        txtV.isSelectable = true
        txtV.layer.cornerRadius = (1/7) * txtV.layer.bounds.width
        txtV.layer.masksToBounds = false
        txtV.textAlignment = .center
    }

    func detectorMethod(targetData: String) {
        guard let linkDetector = try? NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
        else { return }
        let linksFound = linkDetector.matches(in: targetData, options: [], range: NSRange(location: 0, length: targetData.utf16.count))
        
        for individualLink in linksFound {
            guard let range = Range(individualLink.range, in: targetData) else { continue }

            let nsRangeConverted = NSRange(range, in: targetData)
            print(nsRangeConverted)
            txtVattributedSetup(flexibleRange: nsRangeConverted)
            
            let urlStr = String(targetData[range])
            print("The web address detected is: ", urlStr)
        }
    }
                          
    private func htmlConversion() {
        let dataFromHtml = Data(GloballyApplied.mockHtmlStr.utf8)
        if let convertedAttributedStr = try? NSAttributedString(data: dataFromHtml, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {
            print(convertedAttributedStr)
        }
    }
}
