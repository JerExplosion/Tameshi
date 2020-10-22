//
//  ViewController.swift
//  CustomViewMVVM
//
//  Created by Jerry Ren on 10/14/20.
//  Copyright © 2020 N/A. All rights reserved.
//

import WebKit
import UIKit

class ViewController: UIViewController {
    
    var cvViewModel: CVviewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCustomView()
    }

    func setupCustomView() {
        let customViewObject = ViewCustom.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        customViewObject.translatesAutoresizingMaskIntoConstraints = false
        customViewObject.backgroundColor = .cyan
        self.view.addSubview(customViewObject)
        
        let Trconstraint = NSLayoutConstraint.init(item: customViewObject, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: 0)
        let Lconstraint = NSLayoutConstraint.init(item: customViewObject, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 0)
        let Topconstraint = NSLayoutConstraint.init(item: customViewObject, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 0)
        let Bconstraint = NSLayoutConstraint.init(item: customViewObject, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 0)
        self.view.addConstraint(Trconstraint)
        self.view.addConstraint(Lconstraint)
        self.view.addConstraint(Topconstraint)
        self.view.addConstraint(Bconstraint)
    }
      
    
    
    // label in the center in the customView
    
}
 








//        let constraintsCollection = [
//            view.widthAnchor.constraint(equalToConstant: 200),
//            view.heightAnchor.constraint(equalTo: self.view.widthAnchor),
//            view.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
//            view.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
//        ]
//        NSLayoutConstraint.activate(constraintsCollection)
