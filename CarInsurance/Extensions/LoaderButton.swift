//
//  LoaderButton.swift
//  Baqala
//
//  Created by apple on 2/28/19.
//  Copyright © 2019 My Technology. All rights reserved.
//

import UIKit


class LoaderButton: UIButton {
    var originalButtonText: String?
    var originalButtonImage: UIImage?
    var orginalBackgroundColor: UIColor?
    
    var activityIndicator: UIActivityIndicatorView!
    // bloack UI
    func showLoading(view: UIView) {
        originalButtonText = self.titleLabel?.text
        originalButtonImage = self.currentImage
        orginalBackgroundColor = self.backgroundColor
        
        self.setTitle("", for: .normal)
        self.setImage(nil, for: .normal)
        self.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        
        if (activityIndicator == nil) {
            activityIndicator = createActivityIndicator()
        }
       
        showSpinning()
        view.isUserInteractionEnabled = false
    }
    
    func hideLoading(view: UIView) {
        self.setTitle(originalButtonText, for: .normal)
        self.setImage(originalButtonImage, for: .normal)
        self.backgroundColor = orginalBackgroundColor
        activityIndicator.stopAnimating()
        view.isUserInteractionEnabled = true
    }
    //Load without blocking UI
    func showLoading() {
        originalButtonText = self.titleLabel?.text
        originalButtonImage = self.currentImage
        orginalBackgroundColor = self.backgroundColor
        
        self.setTitle("", for: .normal)
        self.setImage(nil, for: .normal)
        self.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
        if (activityIndicator == nil) {
            activityIndicator = createActivityIndicator()
        }
        
        showSpinning()
       
    }
   
    
    func hideLoading() {
        self.setTitle(originalButtonText, for: .normal)
        self.setImage(originalButtonImage, for: .normal)
        self.backgroundColor = orginalBackgroundColor
        activityIndicator.stopAnimating()
      
    }
    private func createActivityIndicator() -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = .white
        return activityIndicator
    }
    
    private func showSpinning() {
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(activityIndicator)
        centerActivityIndicatorInButton()
        activityIndicator.startAnimating()
    }
    
    private func centerActivityIndicatorInButton() {
        let xCenterConstraint = NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: activityIndicator, attribute: .centerX, multiplier: 1, constant: 0)
        self.addConstraint(xCenterConstraint)
        
        let yCenterConstraint = NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: activityIndicator, attribute: .centerY, multiplier: 1, constant: 0)
        self.addConstraint(yCenterConstraint)
    }
}



