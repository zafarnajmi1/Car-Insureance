//
//  ResuableSpinner.swift
//  CarInsurance
//
//  Created by apple on 9/6/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

import UIKit
import SKActivityIndicatorView



func showLoader(){
    
    SKActivityIndicator.show()
}

func hidLoader(){
    SKActivityIndicator.dismiss()
}




open class Spinner {
    internal static var spinner: UIActivityIndicatorView?
    public static var style: UIActivityIndicatorView.Style = .whiteLarge
    public static var baseBackColor = UIColor.black.withAlphaComponent(0.5)
    public static var baseColor = UIColor.white
    public static func start(style: UIActivityIndicatorView.Style = style, backColor: UIColor = baseBackColor, baseColor: UIColor = baseColor) {
        NotificationCenter.default.addObserver(self, selector: #selector(update), name: UIDevice.orientationDidChangeNotification, object: nil)
        if spinner == nil, let window = UIApplication.shared.keyWindow {
            let frame = UIScreen.main.bounds
            spinner = UIActivityIndicatorView(frame: frame)
            spinner!.backgroundColor = backColor
            spinner!.style = style
            spinner?.color = baseColor
            window.addSubview(spinner!)
            spinner!.startAnimating()
        }
    }
    public static func stop() {
        if spinner != nil {
            spinner!.stopAnimating()
            spinner!.removeFromSuperview()
            spinner = nil
        }
    }
    // this is called when device oreintation is changed
    @objc public static func update() {
        if spinner != nil {
            stop()
            start()
        }
    }
}
