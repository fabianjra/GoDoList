//
//  ItemNavbarModel.swift
//  GoDoList
//
//  Created by Fabian Josue Rodriguez Alvarez on 12/3/23.
//

import SwiftUI

class ItemNavbarModel: Decodable, ObservableObject {
    
    @Published public var value: Int
    @Published public var description: String
    
    public init(value: Int, description: String) {
        self.value = value
        self.description = description
    }
    
    enum CodingKeys: CodingKey {
        case value
        case description
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        value = try container.decode(Int.self, forKey: .value)
        description = try container.decode(String.self, forKey: .description)
    }
    
    //For encoding model. It's commented because by now, it's only needed for decoding.
    /*
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }
     */

}
