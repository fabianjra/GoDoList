//
//  HomeView.swift
//  GoDoList
//
//  Created by Fabian Josue Rodriguez Alvarez on 7/3/23.
//

import SwiftUI

struct HomeView: View {
    
    //TODO: General -> pasar todas las vistas a ViewBuilders o vistas por separadas en carpetas para crearlos por View y ViewModel.
    
    //StateObject: Because the class is "ObservableObject":
    //@StateObject private var itemNavbarVM = ItemNavbarViewModel()
    
    
    //StateObject: Because the class is "ObservableObject":
    @StateObject private var itemViewModel = ItemViewModel()
    
    @State private var cardModelList: [Card.Model]
    
    init() {

        cardModelList = [
            Card.Model(type: .asset,
                       status: .open,
                       title: "Request for a new Apple Macbook Pro",
                       date: "25 May",
                       time: "2m"),
            Card.Model(type: .asset,
                       status: .accepted,
                       title: "Request for new table",
                       date: "01 Jun",
                       time: "16m"),
            Card.Model(type: .troubleshoot,
                       status: .onHold,
                       title: "Pago de planillas",
                       date: "11 Jul",
                       time: "50m"),
            Card.Model(type: .asset,
                       status: .inProgress,
                       title: "Chair for users",
                       date: "04 Apr",
                       time: "40m"),
            Card.Model(type: .troubleshoot,
                       status: .solved,
                       title: "Request for laptop",
                       date: "28 March",
                       time: "6d")
        ]
    }
    
    //TODO: General -> Pasar valores a archivo de constantes.
    
    var body: some View {
        ZStack (alignment: .top){
            
            VStack {
                headerBackground
                Spacer()
            }
            
            navbarCustom
            
            VStack {
                Spacer()
                    .frame(height: 60) //Espacio entre el TopView y la barra de cardStatus
                
                cardStatus
                
                sectionTitle
                
                List(cardModelList) { cardModel in
                    Card(model: cardModel)
                }
                .padding(.horizontal, 0)
                .listStyle(.plain)
            }
        }
        
        /*
         //Otra manera de cargar la pantalla, haciendole un onAppear al ZStack
         .onAppear{
         arrayCards = Model.getItems() //Funcion para cargar el modelo de datos
         
         //Repetir el array para tener mas items para la vista:
         arrayCards = Array(repeating: model.getItems(), count 10).flatMap{ $0 }
         }
         */
    }
    
    var headerBackground: some View {
        Rectangle()
            .fill(LinearGradient(colors: Constants.Colors.lightGreenGradiant,
                                 startPoint: .top,
                                 endPoint: .bottom))
            .frame(maxWidth: .infinity)
            .frame(height: 150)
            .mask({
                CustomRectangle() //Header curvado
            })
            .edgesIgnoringSafeArea(.top)
    }
    
    var navbarCustom: some View {
        VStack {
            HStack {
                Button {
                    print("Accion Boton 1")
                } label: {
                    Constants.Images.hamburger
                        .font(.system(size: 25, weight: .bold))
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                
                Spacer()
                
                Text("Inventory Management")
                    .font(.system(size: 20, weight: .bold))
                
                Spacer()
                
                Button {
                    print("Accion Boton 2")
                    //TODO: Agregar accion para agregar una Card.
                } label: {
                    Constants.Images.add
                        .font(.system(size: 25, weight: .bold))
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
            }
            .foregroundColor(.white)
        }
    }
    
    var cardStatus: some View {
        
        //TODO: Agregar accion de filtrado a las cards.
        HStack {
            let newlist = itemViewModel.list.filter{ $0.status == "new" }
            let todoList = itemViewModel.list.filter{ $0.status == "todo" }
            let completedList = itemViewModel.list.filter{ $0.status == "completed" }
            
            ItemNavbarView(model: ItemNavbarModel(count: newlist.count, title: "New"))
                .frame(maxWidth: .infinity, alignment: .center) //Centra equivalemente cada item
            
            ItemNavbarView(model: ItemNavbarModel(count: todoList.count, title: "To do"))
                .frame(maxWidth: .infinity, alignment: .center) //Centra equivalemente cada item
            
            ItemNavbarView(model: ItemNavbarModel(count: completedList.count, title: "Completed"))
                .frame(maxWidth: .infinity, alignment: .center) //Centra equivalemente cada item
            
        }
        .task {
            await itemViewModel.getMockList()
        }
        
        //HStack style:
        .padding(.horizontal, 20)
        .padding(.vertical, 20)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 20.0))
        .shadow(color: .gray.opacity(0.5), radius: 15, x: 0, y: 0)
        .padding(.horizontal, 20)
        .frame(maxWidth: 400, alignment: .center)
        .frame(maxHeight: 90, alignment: .center)
    }
    
    var sectionTitle: some View {
        HStack {
            Text("Due today")
            
            Spacer()
            
            HStack {
                Text("Sort by")
                
                Button {
                    print("Sort by presionado")
                    //TODO: Agregar la accion de ordenamiento
                } label: {
                    Constants.Images.sort
                }
            }
        }
        .padding(.top, 20)
        .foregroundColor(Color.black.opacity(0.5))
        .padding(.horizontal, 20)
    }
    
}//End: ContentView

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
