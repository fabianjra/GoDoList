//
//  CardModel.swift
//  GoDoList
//
//  Created by Fabian Josue Rodriguez Alvarez on 14/3/23.
//

import SwiftUI

class CardModel: Decodable, ObservableObject {
    
    @Published public var title: String
    @Published public var date: String
    @Published public var time: String
    @Published public var status: ItemModel.Status
    
    init(title: String, date: String, time: String, status: ItemModel.Status) {
        self.title = title
        self.date = date
        self.time = time
        self.status = status
    }
    
    enum CodingKeys: CodingKey {
        case title
        case date
        case time
        case status
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
        date = try container.decode(String.self, forKey: .date)
        time = try container.decode(String.self, forKey: .time)
        status = try container.decode(ItemModel.Status.self, forKey: .status)
    }
    
    //For encoding model. It's commented because by now, it's only needed for decoding.
    /*
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }
     */

}
