//
//  ItemNavbarModel.swift
//  GoDoList
//
//  Created by Fabian Josue Rodriguez Alvarez on 12/3/23.
//

import SwiftUI

class ItemNavbarModel: Decodable, ObservableObject {
    
    @Published public var count: Int
    @Published public var title: String
    
    public init(count: Int, title: String) {
        self.count = count
        self.title = title
    }
    
    enum CodingKeys: CodingKey {
        case count
        case title
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        count = try container.decode(Int.self, forKey: .count)
        title = try container.decode(String.self, forKey: .title)
    }
    
    //For encoding model. It's commented because by now, it's only needed for decoding.
    /*
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }
     */

}
