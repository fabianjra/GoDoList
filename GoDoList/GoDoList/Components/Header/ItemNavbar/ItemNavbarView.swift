//
//  ItemNavbar.swift
//  GoDoList
//
//  Created by Fabian Josue Rodriguez Alvarez on 7/3/23.
//

import Foundation
import SwiftUI

struct ItemNavbarView: View {
    
    @ObservedObject private var model: ItemNavbarModel
    
    init(model: ItemNavbarModel) {
        self.model = model
    }
    
    public var body: some View {
        VStack(spacing: ItemNavbarConstants.Spacing.verticalSpacing) {
            Text(model.value.description)
                .font(.system(size: ItemNavbarConstants.Font.sizeValue, weight: .bold))
            
            Text(model.description)
                .font(.system(size: ItemNavbarConstants.Font.sizeDescription))
                .foregroundColor(.gray)
        }
    }
}

struct ItemNavbar_Previews: PreviewProvider {
    static var previews: some View {
        ItemNavbarView(model: ItemNavbarModel(value: 421, description: "Overdue"))
    }
}
