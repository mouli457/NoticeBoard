//
//  DetailsVc.swift
//  NoticeBoard
//
//  Created by mouli chandu gudapati on 31/05/21.
//

import UIKit

class DetailsVc: UIViewController {

    var student : Students?
    var classType : ClassType?
    @IBOutlet var imgVw : UIImageView!
    @IBOutlet var nameLbl : UILabel!
    @IBOutlet var idLbl : UILabel!
    @IBOutlet var descLbl : UILabel!
    @IBOutlet var dateLbl : UILabel!
    var selectDict = NSDictionary()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Details"
        self.navigationController?.isNavigationBarHidden = false
        if classType == ClassType.Splash{
        self.navigationItem.setHidesBackButton(true, animated: true)
        }
        if student == nil {
            let student : Students? = Utils.getStudentData() ?? nil
            self.student = student
        }else {
            Utils.saveStudentData(student: student ?? nil)

        }
        rightNavigationItem()
        updateUI()
    }
    
   fileprivate func updateUI(){
        nameLbl.text = student?.studentName
        idLbl.text = student?.stuId
        descLbl.text = student?.desc
        dateLbl.text = student?.date
   
    DispatchQueue.global().async { [self] in
        guard  let url = URL(string: (student?.image ?? "")) else {return}
        let data = try? Data(contentsOf: url)
        DispatchQueue.main.async { [self] in
            imgVw.image = UIImage(data: data!)
        }
    }
   }
    func rightNavigationItem(){
        let logoutBarButtonItem = UIBarButtonItem(title: "Delete", style: .done, target: self, action: #selector(deleteRecord))
           self.navigationItem.rightBarButtonItem  = logoutBarButtonItem
    }
    
    @objc func deleteRecord(){
        displayAlert()
    }
    


}
