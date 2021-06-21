

import Foundation
struct Students : Codable {
    let studentName : String?
    let desc : String?
    let date : String?
    let title : String?
    let image : String?
    let stuId : String?
    enum CodingKeys: String, CodingKey {

        case studentName = "StudentName"
        case desc = "Desc"
        case date = "Date"
        case title = "Title"
        case image = "image"
        case stuId = "studentId"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        studentName = try values.decodeIfPresent(String.self, forKey: .studentName)
        desc = try values.decodeIfPresent(String.self, forKey: .desc)
        date = try values.decodeIfPresent(String.self, forKey: .date)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        stuId = try values.decodeIfPresent(String.self, forKey: .stuId)
    }

}

