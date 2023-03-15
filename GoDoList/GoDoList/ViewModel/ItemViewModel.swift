//
//  ItemViewModel.swift
//  GoDoList
//
//  Created by Fabian Josue Rodriguez Alvarez on 14/3/23.
//

import SwiftUI

//Main actor: Everything inside this class (properties, functions, etc), Will be call inside the Main Thread
@MainActor
class ItemViewModel: ObservableObject {
    @Published var list: [ItemModel] = []
    
    func getMockList() async {
        guard let list = Utils.decodeJson(jsonName: "Items", model: [ItemModel].self) else {
            //throw NetworkError.jsonDecoder
            return
        }
        self.list = list
    }
}
