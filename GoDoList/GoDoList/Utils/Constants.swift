//
//  Constants.swift
//  GoDoList
//
//  Created by Fabian Josue Rodriguez Alvarez on 7/3/23.
//

import SwiftUI

struct Constants {
    
    // MARK: - Colors
    struct Colors {
        static let lightBlueGradiant: Array = [Color.lightBlue, Color.lightBlue, Color.lighterBlue]
        static let lightGreenGradiant: Array = [Color.globantGreen, Color.globantGreen, Color.globantGreenLight]
    }
    
    // MARK: - Images
    struct Images {
        
        //Views:
        static let hamburger = Image(systemName: "line.3.horizontal")
        static let add = Image(systemName: "plus")
        static let sort = Image(systemName: "slider.vertical.3")

        //Controls:
        static let chevronDown = Image(systemName: "chevron.down")
        
        //Card Type:
        static let stack = Image(systemName: "square.stack.3d.up.fill")
        static let questionMark = Image(systemName: "questionmark.circle.fill")
        
        //TabView icons:
        static let homeIcon = Image(systemName: "house.fill")
        static let categoriesIcon = Image(systemName: "chart.bar.doc.horizontal.fill")
        static let searchIcon = Image(systemName: "magnifyingglass")
        static let settingsIcon = Image(systemName: "gearshape.fill")
    }
}
