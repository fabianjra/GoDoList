//
//  ItemModel.swift
//  GoDoList
//
//  Created by Fabian Josue Rodriguez Alvarez on 14/3/23.
//

//import Foundation
import SwiftUI

//TODO: Use enum
enum Status: String {
    case new
    case todo
    case completed
}

class ItemModel: Decodable, ObservableObject {
    
    @Published public var title: String
    @Published public var date: String
    @Published public var status: String
    
    public init(title: String, date: String, status: String) {
        self.title = title
        self.date = date
        self.status = status
    }
    
    enum CodingKeys: CodingKey {
        case title
        case date
        case status
    }
    
    //For decoding model.
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
        date = try container.decode(String.self, forKey: .date)
        status = try container.decode(String.self, forKey: .status)
    }
    
    //For encoding model.
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(title, forKey: .title)
//        try container.encode(date, forKey: .date)
//        try container.encode(status, forKey: .status)
//    }
    
}
