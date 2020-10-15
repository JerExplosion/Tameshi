//
//  ViewCustom.swift
//  CustomViewMVVM
//
//  Created by Jerry Ren on 10/14/20.
//  Copyright © 2020 N/A. All rights reserved.
//

import Foundation
import UIKit

class ViewCustom: UIView {
    
    var contentString: String?
    var jsonObjctCollection = [JsonObject]()
    var cVviewModel = CVviewModel.init()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInitialization()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInitialization() {
        settingUpCLabel {
            self.constrainingCLabel()
        }
    }
    
    func cLabelCreation() -> UILabel {
        var centeredLabel = UILabel()
        centeredLabel.text = contentString
        centeredLabel.numberOfLines = 0
        centeredLabel.layer.cornerRadius = 3
        centeredLabel.layer.masksToBounds = true
        centeredLabel.backgroundColor = .white
        centeredLabel.textColor = .black
        centeredLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(centeredLabel)
        return centeredLabel
    }
    
    func constrainingCLabel() -> UILabel {
        let centeredLabel = cLabelCreation()
        let horizontalCenter = NSLayoutConstraint.init(item: centeredLabel, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0)
        let verticalCenter = NSLayoutConstraint.init(item: centeredLabel, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0)
        self.addConstraints([verticalCenter, horizontalCenter])
        return centeredLabel
    }
    
    func settingUpCLabel(completionHandler: @escaping (()->())) {
        cVviewModel.gettingDataForVM(stringURL: GloballyApplied.apiUrlString)
        
   //     DispatchQueue.main.async {
            self.cVviewModel.closureUponCompletion = {
                
                   completionHandler()
   //         }
                print("settinguplabel called")
        }
        
    }
    
    
    
}

