//
//  Vctest.swift
//  CarInsurance
//
//  Created by Apple on 7/5/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import  SDWebImage
class HomeVC: BaseViewController, UITableViewDelegate, UITableViewDataSource,UITabBarControllerDelegate {
    

    @IBOutlet weak var insuranceTableview: UITableView!
    @IBOutlet weak var pagercontrol: UIPageControl!
    @IBOutlet weak var lblHeading: UILabel!
    //@IBOutlet weak var insuranceTableview: UITableView!
    //@IBOutlet weak var pagercontrol: UIPageControl!
    //@IBOutlet weak var lblHeading: UILabel!
    //@IBOutlet weak var slidercollection: UICollectionView!
    
    @IBOutlet weak var slidercollection: UICollectionView!
    
    var sliderArray = [Sliders]()
    var insuranceCatgoryArray = [Categories]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = false
        self.setNavigationBar()
        self.slidercollection.register(UINib.init(nibName: "cellSlider", bundle: nil), forCellWithReuseIdentifier: "cellSlider")
        self.tabBarController?.delegate = self
        
        
        
        
    }
//    @objc func updateNotificaitonCount(){
//
////        notificationBadge.setCount(AppUserDefault.shared.unseenNotification)
//
//    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
        
        let guest = UserDefaults.standard.value(forKey: "Guest")
        
        if guest != nil {
            
            if tabBarController.selectedIndex == 1{
                self.guestAlertForQuotes()
            }
            
        }else{
        
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        hidLoader()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
       
        //tabBarController?.tabBar.items![0].title = "Home".localized
        
          self.navigationItem.title = "Car Insurance".localized
        self.sliderArray.removeAll()
        self.insuranceCatgoryArray.removeAll()
        self.sliderArray = AppUserDefault.shared.settingData?.sliders ?? []
        self.insuranceCatgoryArray = AppUserDefault.shared.settingData?.categories ?? []
        self.setNavigationBar()
        setSlider()
        addNavigationButton()
        
         self.view.localized()
        insuranceTableview.localized()
        insuranceTableview.reloadData()
        lblHeading.text = "Select Insurance You Want Quote For".localized
        
        
    }
    
    
    func setSlider(){
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width:self.slidercollection.frame.width, height: self.slidercollection.frame.height)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        self.slidercollection!.collectionViewLayout = layout
        Timer.scheduledTimer(timeInterval: 4.0, target: self, selector: #selector(self.scrollAutomatically), userInfo: nil, repeats: true)
        
        
    }
    
    
    @objc func scrollAutomatically(_ timer: Timer) {
        
        if let coll  = self.slidercollection {
            for cell in coll.visibleCells {
                let indexPath: IndexPath? = coll.indexPath(for: cell)
                if ((indexPath?.row)!  < 3 - 1){
                    let indexPath1: IndexPath?
                    indexPath1 = IndexPath.init(row: (indexPath?.row)! + 1, section: (indexPath?.section)!)
                    
                    coll.scrollToItem(at: indexPath1!, at: .right, animated: true)
                }
                else{
                    let indexPath1: IndexPath?
                    indexPath1 = IndexPath.init(row: 0, section: (indexPath?.section)!)
                    coll.scrollToItem(at: indexPath1!, at: .left, animated: true)
                }
                
            }
        }
    }

    
    func addNavigationButton()
    {
        let btn1 = UIButton(frame: CGRect(x: 0, y: 0, width: 15, height: 16))
        btn1.setBackgroundImage(UIImage(named: "chat"), for: .normal)
        
        //        let btn1 = UIButton(type: .custom)
        //        btn1.setImage(UIImage(named: "chat"), for: .normal)
        //btn1.frame = CGRect(x: 10, y: 0, width: 40, height: 40)
        btn1.addTarget(self, action: #selector(btnmsgClick(_:)), for: .touchUpInside)
        let btnmsg = UIBarButtonItem(customView: btn1)
        
        //        let btn2 = UIButton(type: .custom)
        //        btn2.setImage(UIImage(named: "notifi"), for: .normal)
        //        btn2.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
//        let btn2 = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
//        btn2.setBackgroundImage(UIImage(named: "notifi"), for: .normal)
//        btn2.addTarget(self, action: #selector(btnnotificationhClick(_:)), for: .touchUpInside)
//        let btnnotification = UIBarButtonItem(customView: btn2)
        
        
        self.navigationItem.setRightBarButtonItems([notificationButton(),btnmsg], animated: true)
        
    }
    
    @objc func btnmsgClick (_ sender: Any){
        
        let guest = UserDefaults.standard.value(forKey: "Guest")
        
        if guest != nil {
            
            self.guestAlert()
            
        }else{
            
            let storyboard = UIStoryboard(name: "Chat", bundle: nil)
            let vc =  storyboard.instantiateViewController(withIdentifier: "ChatVC") as! ChatVC
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
        
        //        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //        let vc =  storyboard.instantiateViewController(withIdentifier: "VCAddtoCart") as! VCAddtoCart
        //        self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
    @objc func btnnotificationhClick (_ sender: Any){
        
        let guest = UserDefaults.standard.value(forKey: "Guest")
        
        if guest != nil {
            
            self.guestAlert()
            
        }else{
            
            let storyboard = UIStoryboard(name: "Chat", bundle: nil)
            let vc =  storyboard.instantiateViewController(withIdentifier: "NotificationVC") as! NotificationVC
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 260
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.insuranceCatgoryArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell") as? homeCell
        
        cell?.bgimage.sd_imageIndicator = SDWebImageActivityIndicator.gray
        cell?.bgimage.sd_setImage(with: URL(string: self.insuranceCatgoryArray[indexPath.row].image!), placeholderImage: UIImage(named: "Bg"))
        cell?.lblheading.text = self.insuranceCatgoryArray[indexPath.row].title
        cell?.txtview.text = self.insuranceCatgoryArray[indexPath.row].detail?.html2String
        
        
        cell?.loadhomecel(index:indexPath.row)
        cell?.delegate = self
        cell?.selectionStyle = .none
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let guest = UserDefaults.standard.value(forKey: "Guest")
        if guest != nil {

            self.guestAlert()

        }else{

                let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "VCVehicalInformation") as? VCVehicalInformation
                vc!.insuranceId = self.insuranceCatgoryArray[indexPath.row]._id!
                vc?.inuranceCatgory = self.insuranceCatgoryArray[indexPath.row].title ?? ""
                vc?.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(vc!, animated: true)
        }
    }
    

}
extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.pagercontrol.numberOfPages = self.sliderArray.count
        
        return self.pagercontrol.numberOfPages
        //        self.pagger.numberOfPages = appdelegate.sliderArray.count
        //        return self.pagger.numberOfPages
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: self.slidercollection.bounds.size.width, height:   self.slidercollection.bounds.size.height)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "cellSlider", for: indexPath) as! cellSlider
       
        let model = self.sliderArray[indexPath.row]
        cell.setData(model: model)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.pagercontrol.currentPage = indexPath.row
    }

}
extension HomeVC:  homeprotocool{
    func myhome(Index: Int) {
        
        let guest = UserDefaults.standard.value(forKey: "Guest")
        if guest != nil {
            
            self.guestAlert()
            
        }else{
            
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "VCVehicalInformation") as? VCVehicalInformation
            vc!.insuranceId = self.insuranceCatgoryArray[Index]._id!
            vc?.inuranceCatgory = self.insuranceCatgoryArray[Index].title ?? ""
            vc?.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc!, animated: true)
        }
    }
    
    
    
}
