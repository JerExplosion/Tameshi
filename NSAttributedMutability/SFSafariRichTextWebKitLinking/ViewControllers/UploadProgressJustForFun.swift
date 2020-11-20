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
    
    //    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject])
    //    {
    //        myImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
    //        myImageView.backgroundColor = UIColor.clear
    //        self.dismiss(animated: true, completion: nil)
    //        uploadImage()
    //    }
    //
    //    func uploadImage()
    //    {
    //        let imageData = UIImageJPEGRepresentation(myImageView.image, 1)
    //        if(imageData == nil ) { return }
    //        self.uploadButton.enabled = false
    //
    //        let uploadScriptUrl = NSURL(string:"https://www.freewebmentor.com/apiscript")
    //        var request = NSMutableURLRequest(URL: uploadScriptUrl!)
    //        request.HTTPMethod = "POST"
    //        request.setValue("Keep-Alive", forHTTPHeaderField: "Connection")
    //
    //        var configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
    //        var session = NSURLSession(configuration: configuration, delegate: self, delegateQueue: NSOperationQueue.mainQueue())
    //
    //        var task = session.uploadTaskWithRequest(request, fromData: imageData)
    //        task.resume()
    //    }
    //
    //    func URLSession(session: URLSession, task: URLSessionTask, didCompleteWithError error: NSError?)
    //    {
    //        println("didCompleteWithError")
    //        let myAlert = UIAlertView(title: "Alert", message: error?.localizedDescription, delegate: nil, cancelButtonTitle: "OK")
    //        myAlert.show()
    //        self.uploadButton.enabled = true
    //    }
    
    //    func URLSession(session: NSURLSession, dataTask: NSURLSessionDataTask, didReceiveResponse response: NSURLResponse, completionHandler: (NSURLSessionResponseDisposition) -> Void)
    //    {
    //        println("didReceiveResponse")
    //        println(response);
    //        self.uploadButton.enabled = true
    //    }
    //    func URLSession(session: NSURLSession, dataTask: NSURLSessionDataTask, didReceiveData data: NSData)
    //    {
    //        println("didReceiveData")
    //    }
}
