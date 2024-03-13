//
//  PagoView.swift
//  TiendaUI
//
//  Created by Liquid on 13/3/24.
//

import SwiftUI

struct PagoView: View {
    
    @EnvironmentObject var lista: List
    
    let paymentTypes = ["Efectivo", "Tarjeta de credito", "Programa de puntos"]
    
    @State private var paymentType = "Efectivo"
    
    @State private var addCuponDetails = false
    
    @State private var cuponCode = ""
    
    let propinas = [0, 5, 10, 15, 20]
    
    @State private var propina = 5
    
    var totalPrice: String {
        let total = Double(lista.total)
        let totalPropina = total/100 * Double(propina)
        return (total + totalPropina).formatted(.currency(code: "EUR"))
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
            Section("¿Dejar propina?") {
                Picker("Porcentaje de propina", selection: $propina){
                    ForEach(propinas, id: \.self){
                        Text("\($0)%")
                    }
                }
                .pickerStyle(.segmented)
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
        .environmentObject(List())
}

