//
//  StoreCellView.swift
//  StoresApp
//
//  Created by Mohamed Rizvi on 2022-09-05.
//

import SwiftUI

struct StoreCellView: View {
    
    var store: StoresCellViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            HStack(alignment: .top, spacing: 10){
                
                ImageView(imageUrl: store.image)
                    .frame(width: 60, height: 60)
                    .cornerRadius(30)
                
                CellNameView(store: store)
                
                Spacer()
                
                Image("option")
                    .frame(width: 35, height: 10)
                    .padding(.top, 8)
            }
            
            //Distance and delivery view
            BottomCellView(store: store)
            
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 15)
        .overlay(RoundedRectangle(cornerRadius: 10)
        .stroke(Color(Constant.Color.border), lineWidth: 1))
    }
}

struct StoreCellView_Previews: PreviewProvider {
    static var previews: some View {
        StoreCellView(store: StoresCellViewModel(Stores(id: "1", name: "Store Name Input", description: "61 Souli Point road North Sydney NSW 2060", image: "stores", distance: "2.7mk", isDeliveryAvailable: true)))
        
    }
}

struct CellNameView: View {
    var store: StoresCellViewModel
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            Text(store.name)
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(Color(Constant.Color.blackText))
                .lineLimit(1)
            
            Text(store.description)
                .font(.system(size: 16, weight: .regular))
                .padding(.bottom, 20)
                .foregroundColor(Color(Constant.Color.grayText))
                .lineLimit(2)
        }
    }
}

struct BottomCellView: View {
    var store: StoresCellViewModel
    
    var body: some View {
        HStack(alignment: .center, spacing: 10){
            Text(store.distance)
                .font(.system(size: 14, weight: .regular))
                .frame(width: 60, height: 40)
            Image("check")
                .frame(width: 20, height: 20)
            Text("Click & Collect")
                .font(.system(size: 14, weight: .regular))
            Spacer()
            Image(store.deliveryIcon())
                .frame(width: 20, height: 20)
                .font(.system(size: 14, weight: .regular))
            Text("Delivery")
                .padding(.trailing, 10)
                .font(.system(size: 14, weight: .regular))
                .foregroundColor(Color(store.deliveryText()))
        }
    }
}
