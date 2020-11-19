//
//  TxtViewDelegateExtends.swift
//  SFSafariRichTextWebKitLinking
//
//  Created by Jerry Ren on 11/18/20.
//

import UIKit

extension EntranceViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        UIApplication.shared.open(URL)
        return false
    }
}
