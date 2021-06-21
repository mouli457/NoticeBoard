//
//  Utils.swift
//  NoticeBoard
//
//  Created by mouli chandu gudapati on 01/06/21.
//

import Foundation
import UIKit
let permDefaults = UserDefaults(suiteName: "permDefaults")

class Utils {
    
    static func saveStudentData(student: Students?) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(student) {
            permDefaults?.set(encoded, forKey: "studentData")
        }
        permDefaults?.synchronize()
    }
    
    static func getStudentData() -> Students? {
        guard let bioresult = permDefaults?.object(forKey: "studentData") as? Data else {
            return nil }
        let decoder = JSONDecoder()
        let student = try? decoder.decode(Students.self, from: bioresult)
        return student
        
    }
    
  
}

enum ClassType {
    case Splash
}

extension UIViewController {
    func displayAlert()  {
        let alert = UIAlertController(title: "Notice Board", message: "Are you sure do you want to delete this recoed?", preferredStyle: .alert)
            
             let ok = UIAlertAction(title: "OK", style: .default, handler: { action in
                self.redirectSplash()
             })
             alert.addAction(ok)
             let cancel = UIAlertAction(title: "Cancel", style: .default, handler: { action in
             })
             alert.addAction(cancel)
             DispatchQueue.main.async(execute: {
                self.present(alert, animated: true)
        })
    }
    
    func redirectSplash(){
    Utils.saveStudentData(student: nil)
    guard let verifyObj = storyboard?.instantiateViewController(withIdentifier: "SplashVC") as? SplashVC else {
        return
    }
    navigationController?.pushViewController(verifyObj, animated: false)
    }
    
    func redirectDashboard(){
        guard let verifyObj = storyboard?.instantiateViewController(withIdentifier: "NoticeBoardVC") as? NoticeBoardVC else {
            return
        }
        navigationController?.pushViewController(verifyObj, animated: true)
    }
    
    func redirectDetailsPage(){
        guard let verifyObj = storyboard?.instantiateViewController(withIdentifier: "DetailsVc") as? DetailsVc else {
            return
        }
        verifyObj.classType = ClassType.Splash
        navigationController?.pushViewController(verifyObj, animated: true)
    }
}
