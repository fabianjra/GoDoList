//
//  TabViewIcons.swift
//  GoDoList
//
//  Created by Fabian Josue Rodriguez Alvarez on 7/3/23.
//

import SwiftUI

enum TabViewIcons: String, CaseIterable, Identifiable {
    public var id: Self { self }
    case home
    case search
    case settings
    
    var imageIcon: Image {
        switch self {
        case .home: return Constants.Images.homeIcon
        case .search: return Constants.Images.searchIcon
        case .settings: return Constants.Images.settingsIcon
        }
    }
    
    @ViewBuilder
    var view: some View {
        switch self {
        case .home: HomeView()
        case .search: Color.red
        case .settings: Color.green
        }
    }
    
//    @ViewBuilder
//    func getView(model1: [ItemNavbar.Model], model2: [Card.Model]) -> some View {
//        switch self {
//        case .home: HomeView()
//        case .categories: Color.yellow
//        case .search: Color.red
//        case .settings: Color.green
//        }
//    }
}
