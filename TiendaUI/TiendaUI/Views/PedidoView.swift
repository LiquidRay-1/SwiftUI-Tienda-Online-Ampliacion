//
//  PedidoView.swift
//  TiendaUI
//
//  Created by Liquid on 13/3/24.
//
import SwiftUI

struct PedidoView: View {
    
    @EnvironmentObject var lista: List
    
    var body: some View {
        
        NavigationStack {
                Section{
                    ForEach(lista.items){ item in
                        HStack{
                            Text(item.title)
                            Spacer()
                            Text(String(format: "%.2f", item.price) + "€")
                        }
                    }
                    .onDelete(perform: deleteItems)
                }
                Section{
                    NavigationLink("Finalizar pedido"){
                        PagoView()
                    }
                }
                .disabled(lista.items.isEmpty)
            .navigationTitle("Pedido")
            .toolbar{
                EditButton()
                    .disabled(lista.items.isEmpty)
            }
        }
    }
    func deleteItems(at offsets: IndexSet){
        lista.items.remove(atOffsets: offsets)
    }
}

#Preview {
    PedidoView()
        .environmentObject(List())
}

