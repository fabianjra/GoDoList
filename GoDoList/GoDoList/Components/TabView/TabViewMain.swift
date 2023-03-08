//
//  TabViewMain.swift
//  GoDoList
//
//  Created by Fabian Josue Rodriguez Alvarez on 7/3/23.
//

import SwiftUI

struct TabViewMain: View {
    
    @State private var selectedTab: TabViewIcons
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.white
        selectedTab = .home //Home tab selected by default
    }
    
    //Valida que la pantalla presente tenga insets. Esto para validar en pantallas de iPhone 13 o iphone 8, se muestre el padding del bottom o no.
    //let insets = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first(where: {$0.isKeyWindow})?.safeAreaInsets ?? .zero
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            
            ForEach(TabViewIcons.allCases, id: \.self) { tabView in
                tabView.view
                    .tabItem {
                        tabView.imageIcon
                        Text(tabView.rawValue.capitalized)
                    }
            }
        }
    }
}

struct TabViewMain_Previews: PreviewProvider {
    static var previews: some View {
        TabViewMain()
    }
}
