//
//  NoticeBoardVC.swift
//  NoticeBoard
//
//  Created by mouli chandu gudapati on 31/05/21.
//

import UIKit

class NoticeBoardVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet var studentTsableview : UITableView!
    var viewModelUser = NoticeBoardViewModel()
    var students = [Students]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.setHidesBackButton(true, animated: true)

        self.title = "Notifications"
        viewModelUser.getAll(completion: { results in
            self.students = results
            self.reloadTableData()
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
       
    }
    func reloadTableData(){
        self.studentTsableview.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = studentTsableview.dequeueReusableCell(withIdentifier: "StudentCell") as! StudentCell
        let sData = students[indexPath.row]
        cell.updateStudentData(student:sData )
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let detailsVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailsVc") as! DetailsVc
        detailsVC.student = students[indexPath.row]
        self.navigationController?.pushViewController(detailsVC, animated: true)
    }
}

