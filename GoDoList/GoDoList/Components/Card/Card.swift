//
//  Card.swift
//  GoDoList
//
//  Created by Fabian Josue Rodriguez Alvarez on 7/3/23.
//

import SwiftUI

struct Card: View {
    
    @ObservedObject private var model: ItemModel
    
    init(model: ItemModel) {
        self.model = model
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 13) {
            HStack{
                model.status.icon
                Text(model.title).font(.system(size: 15, weight: .light))
                
                Spacer()
                
                Circle().frame(width: 10, height: 10)
                    .foregroundColor(model.status.color)
                
                Text(model.status.description).font(.system(size: 15, weight: .light))
            }.foregroundColor(.gray)
            
            Text(model.title)
                .font(.system(size: 16, weight: .bold))
            
            HStack {
                Text("Date").foregroundColor(.gray)
                Text(model.date)
                //                Constants.Images.chevronDown
                //                    .font(.system(size: 13, weight: .bold))
                
                Spacer()
                
                Text("2m") //TODO: Restar tiempo de vida del item.
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 20)
        .frame(maxWidth: .infinity)
        
        //Crea el color al lado izquierdo para identificar la card
        .overlay(
            HStack{
                Rectangle()
                    .fill(model.status.color)
                //.padding(.vertical, -20)
                    .frame(width: 5)
                Spacer()
            }//.frame(maxWidth: .infinity)
        )
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: .gray.opacity(0.5), radius: 15.0, x: 0, y: 0)
        .padding(.vertical, 10) //Separacion extra del exterior
        //.padding(.horizontal, 20) //Separacion extra del exterior
        .listRowSeparator(.hidden) //Oculta la linea separadora cuando se agrega en un List
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(model: ItemModel(title: "Make de dishes", date: "25 may", status: .new))
    }
}
