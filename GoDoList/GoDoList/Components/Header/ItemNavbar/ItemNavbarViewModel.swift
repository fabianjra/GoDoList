//
//  ItemNavbarViewModel.swift
//  GoDoList
//
//  Created by Fabian Josue Rodriguez Alvarez on 12/3/23.
//

import SwiftUI

//Main actor: Everything inside this class (properties, functions, etc), Will be call inside the Main Thread
@MainActor
class ItemNavbarViewModel: ObservableObject {
    
    @Published var list: [ItemNavbarModel] = []

//    init(itemNavbarList: [ItemNavbarModel]) {
//        self.itemNavbarList = itemNavbarList
//    }

    func getItemsMock() async {
        
        guard let list = Utils.decodeJson(jsonName: "ItemNavbarList", model: [ItemNavbarModel].self) else {
            //throw NetworkError.jsonDecoder
            return
        }
        
        self.list = list
    }
}
