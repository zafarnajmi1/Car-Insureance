//
//  DropDownSectionCell.swift
//  CarInsurance
//
//  Created by Apple on 7/25/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import  DropDown
enum LoadedFrom : Int {
    case question
    case answer
    case child
    case Place
    
}
protocol HomeProtocol {
    func dropDownCall(selectedoption: Options?, index: Int, row: Int)
    //_ option : Options?, _ question : Questions?,_ children : Children?
    func dropDownSelected()
}
class DropDownSectionCell: VehicalInfoBaseCell {
    var delegate:HomeProtocol?
    
    var carmakeDrowpDown = DropDown()
    var optionArray = [Options]()
    var childArray = [Children]()
    @IBOutlet weak var btndropwdownsender: UIButton!
    @IBOutlet weak var txtquestion: UITextField!
    @IBOutlet weak var mainViewQuestions: UIView!
    @IBOutlet weak var lblMainQuestionsHeding: UILabel!
    
    var isLoadedFromQuestion : LoadedFrom = .question
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.mainViewQuestions.setcornerUiview(Corner: 10)
        let tfs = [txtquestion] as! [UITextField]
        AppLanguage.updateTextFieldsDirection(tfs)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
   
    @IBAction func btnDropwDownAction(_ sender: UIButton) {
        
        
        
        carmakeDrowpDown.anchorView = btndropwdownsender
        carmakeDrowpDown.backgroundColor =  #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        carmakeDrowpDown.selectionBackgroundColor =  #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
    
        
        if isLoadedFromQuestion == .question {
            carmakeDrowpDown.dataSource = self.optionArray.map({$0.title!})
            
        }
        else{
            carmakeDrowpDown.dataSource = self.childArray.map({$0.title!})
        }
        
                DropDown.appearance().textColor = #colorLiteral(red: 0.5527616143, green: 0.5568413734, blue: 0.5609211326, alpha: 1)
                DropDown.appearance().selectedTextColor = UIColor.red
                DropDown.appearance().textFont = UIFont(name: "JosefinSans-Regular", size: 18)!
                self.carmakeDrowpDown.customCellConfiguration = { (index: Index, item: String, cell: DropDownCell) -> Void in
        
                    cell.optionLabel.textAlignment = .center
        
                }
        
                carmakeDrowpDown.bottomOffset = CGPoint(x: 0, y: btndropwdownsender.bounds.height)
                carmakeDrowpDown.selectionAction = {(index: Int, item: String) in
                    
                    
                    
                    if self.isLoadedFromQuestion == .question{
                        

                        self.question?.selectedAns = index
                        
                        for ans in self.question?.options ?? []{
                            ans.selectedAns = nil
                            
                            for child in ans.children ?? []{
                                child.selectedAns = nil
                                
                            }
                        }
                        
                        let key = self.question?._id ?? ""
                        let value = self.question?.options?[index]._id ?? ""
                        
                        self.question?.selectedAns = index
                        
                        self.params?.params.updateValue(value, forKey: key)
                        
                        
                    }
                    else if self.isLoadedFromQuestion == .answer{
                        
                        self.option?.selectedAns = index
                        
                        
                            for child in self.option?.children ?? []{
                                child.selectedAns = nil
                                
                            }
                        
                        
                        let key = self.question?._id ?? ""
                        let value = self.option?.children![index]._id ?? ""
                        
                        self.params?.params.updateValue(value, forKey: key)
                    }
                    else if self.isLoadedFromQuestion == .child{
                       
                        self.child?.selectedAns = index
                        let key = self.question?._id ?? ""
                        let value = self.child?.children![index]._id ?? ""
                        print(value)
                        self.params?.params.updateValue(value, forKey: key)
                        
                    }
                    
                      
                        self.txtquestion.text = item
                        self.question?.answerText = item
                        self.delegate?.dropDownSelected()
                  
                }
                carmakeDrowpDown.show()
        
        
        
        
        
    }
    
    
    
    func loadCellChild(object : Children, question : Questions) {
       
        child = object
         self.question = question
        self.childArray = object.children!
         isLoadedFromQuestion = .child
        self.txtquestion.placeholder = self.question?.placeholder
         self.txtquestion.text =  self.question?.answerText
        
    }
    func loadCellAns(object : Options, question : Questions) {
      
        self.option = object
        self.question = question
        self.childArray = object.children!
         isLoadedFromQuestion = .answer
         self.txtquestion.placeholder = self.question?.placeholder
        
        self.txtquestion.text =  self.question?.answerText
    }
    
    func loadCell(object : Questions) {
        
        question = object
        lblMainQuestionsHeding.text = object.title
        self.optionArray = object.options ?? []
        isLoadedFromQuestion = .question
         self.txtquestion.placeholder = self.question?.placeholder
         self.txtquestion.text =  self.question?.answerText
        
    }
    
//    func loadPlaceCell(object : Questions) {
//        isLoadedFromQuestion = .Place
//        question = object
//        lblMainQuestionsHeding.text = object.title
//        self.optionArray = object.options!
//        
//    }
    
    
}

