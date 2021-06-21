//
//  SplashVC.swift
//  NoticeBoard
//
//  Created by mouli chandu gudapati on 31/05/21.
//

import UIKit

class SplashVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationCheck()
    }

    private func navigationCheck() {
        let student: Students? = Utils.getStudentData() ?? nil

        if student != nil, !(student?.studentName ?? "").isEmpty {
            redirectDetailsPage()
        } else {
            redirectDashboard()
        }
    }
}
