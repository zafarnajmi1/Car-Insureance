//
//  VCInsurancePolicyImage.swift
//  CarInsurance
//
//  Created by Apple on 8/26/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import  SDWebImage
class VCInsurancePolicyImage: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var myscorl: UIScrollView!
    @IBOutlet weak var myimg: UIImageView!
    var policyPath = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        myscorl.delegate = self
        myscorl.minimumZoomScale = 1.0
        myscorl.maximumZoomScale = 10
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.myimg.sd_imageIndicator = SDWebImageActivityIndicator.gray
        self.myimg.sd_setImage(with: URL(string: policyPath), placeholderImage: UIImage(named: "placeholder"))
    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return myimg
    }
    
    @IBAction func cancelAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    

}
