//
//  InsuranceRegisterSteps.swift
//  CarInsurance
//
//  Created by Apple on 7/22/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class InsuranceRegisterSteps: NSObject {
    //MARK:- Vehical Information
    var insuranceID : String?
    var carmake: String?
    var  carModel: String?
    var ModelDetail: String?
    var RegistratgionPlace: String?
    var MarkeValueOfCar: String?
    var VehicalLicense: UIImage?
    var VinNo: UIImage?
    var whenDowant: String?
    
    //MARK:- DriverDetail
    var driverDateOfbirth: String?
    var nationality: String?
    var LicenseIssueDate: String?
    var drivingExperince: String?
    var drivingLicenceimage: UIImage?
    
    //MARK:- Claim Details
    var lastmonthYes: Bool?
    var lastmonthNo: Bool?
    var mycarPrivateUseYes: Bool?
    var mycarPrivateUseNo: Bool?
    var mycarIsGCCYes: Bool?
    var mycarIsGCCNo: Bool?
}
