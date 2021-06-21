//
//  NoticeBoardViewModel.swift
//  NoticeBoard
//
//  Created by mouli chandu gudapati on 31/05/21.
//

import UIKit
import Alamofire

class NoticeBoardViewModel{
    weak var vc : NoticeBoardVC?
    var stuennts = [Students]()
    
    func getAll(completion:  @escaping ( [Students] ) -> ()) {
        AF.request(Constants.requestUrl).response { response in
            if let data = response.data {
                do{
                    let studentsData = try JSONDecoder().decode([Students].self, from: data)
                    completion(studentsData)
                }catch let err{
                    print(err.localizedDescription)
                }
            }
        }
    }
}
