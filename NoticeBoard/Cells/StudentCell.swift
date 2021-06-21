//
//  tableCell.swift
//  NoticeBoard
//
//  Created by mouli chandu gudapati on 31/05/21.
//

import UIKit

class StudentCell: UITableViewCell {
    @IBOutlet var bgView : UIView!
    @IBOutlet var nameLbl : UILabel!
    @IBOutlet var titleLbl : UILabel!
    @IBOutlet var descLbl : UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func updateStudentData(student:Students) {
        nameLbl.text = student.studentName
        titleLbl.text = student.title
        descLbl.text = student.desc
    }
}
