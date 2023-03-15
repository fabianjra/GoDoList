//
//  ItemModel.swift
//  GoDoList
//
//  Created by Fabian Josue Rodriguez Alvarez on 14/3/23.
//

//import Foundation
import SwiftUI

class ItemModel: Identifiable, Decodable, ObservableObject {
    public var id = UUID()
    @Published public var title: String
    @Published public var date: String
    @Published public var status: Status
    
    public init(title: String, date: String, status: Status) {
        self.title = title
        self.date = date
        self.status = status
    }
    
    enum CodingKeys: CodingKey {
        case title
        case date
        case status
    }
    
    //For decoding model. It's neccesary because this model is using "Decodable" with "ObservableObject".
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
        date = try container.decode(String.self, forKey: .date)
        status = try container.decode(Status.self, forKey: .status)
    }
    
    enum Status: String, Identifiable, Decodable, CustomStringConvertible {
        public var id: Self { self }
        case new
        case todo
        case completed
        
        var color: Color {
            switch self {
            case .new: return Color.green
            case .todo: return Color.yellow
            case .completed: return Color.gray
            }
        }
        
        var description: String {
            switch self {
            case .new: return "New"
            case .todo: return "To do"
            case .completed: return "Completed"
            }
        }
        
        var icon: Image {
            switch self {
            case .new: return Constants.Images.sparkIcon
            case .todo: return Constants.Images.textAppendIcon
            case .completed: return Constants.Images.checkIcon
            }
        }
    }
    
    //For encoding model.
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(title, forKey: .title)
//        try container.encode(date, forKey: .date)
//        try container.encode(status, forKey: .status)
//    }
    
}
