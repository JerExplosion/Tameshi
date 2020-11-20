//
//  UploadProgressJustForFun.swift
//  SFSafariRichTextWebKitLinking
//
//  Created by Jerry Ren on 11/19/20.
//

import Foundation
import UIKit
// borrowed code below, checking image-upload progress, self-modified though
class ImgUploaderProgressiveViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, URLSessionDataDelegate, URLSessionDelegate, URLSessionTaskDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func URLSession(session: URLSession, task: URLSessionTask, didSendBodyData bytesSent: Int64, totalBytesSent: Int64, totalBytesExpectedToSend: Int64)
    {
        var uploadProgress:Float = Float(totalBytesSent) / Float(totalBytesExpectedToSend)
        
        imageUploadProgressView.progress = uploadProgress
        let progressPercent = Int(uploadProgress*100)
        progressLabel.text = "\(progressPercent)%"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func uploadButtonTapped(sender: AnyObject) {
        var myPickerController = UIImagePickerController()
        myPickerController.delegate = self
        myPickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
        self.present(myPickerController, animated: true, completion: nil)
    }
    
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var imageUploadProgressView: UIProgressView!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var uploadButton: UIButton!
}
