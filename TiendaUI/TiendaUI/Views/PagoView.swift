//
//  PagoView.swift
//  TiendaUI
//
//  Created by Ivan on 13/3/24.
//

import SwiftUI

struct PagoView: View {
    
    @EnvironmentObject var lista: Lista
    
    let paymentTypes = ["Efectivo", "Tarjeta de credito", "Programa de puntos"]
    
    @State private var paymentType = "Efectivo"
    @State private var addCuponDetails = false
    @State private var cuponCode = ""
    
    var totalPrice: String {
        let total = Double(lista.total)
        return (total).formatted(.currency(code: "EUR"))
    }
    
    @State private var showingPaymentAlert = false
    
    var body: some View {
        Form {
            Section {
                Picker("Forma de pago", selection: $paymentType){
                    ForEach(paymentTypes, id: \.self){
                        Text($0)
                    }
                }
            }
            Section {
                Toggle("Tengo un cupon de descuento", isOn: $addCuponDetails)
                if addCuponDetails == true {
                    TextField("Introduce tu cupon", text: $cuponCode)
                }
            }
    
            Section("Total: \(totalPrice)"){
                Button("Confirmar pedido"){
                    showingPaymentAlert.toggle()
                }
            }
        }
        .navigationTitle("Finalizar compra")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Pedido confirmado", isPresented: $showingPaymentAlert){
            
        } message: {
            Text("El importe total del pedido es de \(totalPrice)")
        }
    }
}

#Preview {
    PagoView()
        .environmentObject(Lista())
}

