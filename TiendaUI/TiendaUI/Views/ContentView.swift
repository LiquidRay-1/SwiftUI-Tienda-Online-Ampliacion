//
//  ContentView.swift
//  TiendaUI
//
//  Created by dam2 on 19/2/24.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(ModelData.self) var modelData
    @EnvironmentObject var list: List
    @EnvironmentObject var favoritos: Favoritos
    @State private var showAlert = false
    
    var producto: ProductosItem
    
    var productoIndex: Int {
        modelData.productos.firstIndex(where: {$0.id == producto.id})!
    }
    
    var body: some View {
        
        @Bindable var modelData = modelData
        
        VStack {
            Spacer()
            AsyncImage(
                url: producto.imageUrl,
                content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                },
                placeholder: {
                    ProgressView()
                }
            )
            .frame(maxWidth:
                    150, minHeight: 150)
            Spacer()
            HStack{
                Text(producto.title)
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .padding()
                FavoriteButton(isSet: favoritos.isFavorite(producto), producto: producto)
            }
            HStack{
                Text(producto.category)
                    .font(.title2)
                    Spacer()
                Text(String(format: "%.2f", producto.price) + "€")
                    .font(.title2)
            }
            HStack {
                Text(String(format: "%.1f", producto.rating.rate))
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
                Spacer()
                Text("\(producto.rating.count)")
                Image(systemName: "person.fill")
            }
            Divider()
            Text(producto.description)
            Spacer()
            Button("Comprar producto") {
                list.add(item: producto)
                showAlert.toggle()
            }
            .foregroundColor(.white)
            .padding()
            .background(Color(.blue))
            .cornerRadius(10)
            Spacer()
        }
        .padding()
            .navigationTitle(producto.title)
            .navigationBarTitleDisplayMode(.inline)
            .alert("Articulo añadido al pedido", isPresented: $showAlert){
                
            } message: {
                Text("El articulo se ha añadido al pedido")
            }
    }
}

#Preview {
    NavigationStack{
        ContentView(producto: ModelData().productos[0])
            .environment(ModelData())
            .environmentObject(List())
            .environmentObject(Favoritos())
    }
}
