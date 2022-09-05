//
//  StoreDetailView.swift
//  StoresApp
//
//  Created by Mohamed Rizvi on 2022-09-05.
//

import SwiftUI

struct StoreDetailView: View {
    
    @StateObject private var viewModel = StoreDetailViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var store: StoresCellViewModel
    
    var body: some View {
        VStack {
            //Store details view
            StoreDetails(store: store)
            
            //Distance and Delivery View
            BottomCellView(store: store)
                .padding(.horizontal, 15)
            
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarHidden(false)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton(presentationMode: presentationMode))
        .ignoresSafeArea(.all)
    }
}

struct StoreDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StoreDetailView(store: StoresCellViewModel(Stores(id: "1", name: "Store Name Input", description: "61 Souli Point road North Sydney NSW 2060", image: "stores", distance: "2.7mk", isDeliveryAvailable: true)))
    }
}


struct StoreDetails: View {
    var store: StoresCellViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ImageView(imageUrl: store.image)
                .frame(width: UIScreen.main.bounds.width, height: 300)
                .background(Color(Constant.Color.imageBackground))
            
            Text(store.name)
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(Color(Constant.Color.blackText))
                .padding(.horizontal, 15)
            
            Text(store.description)
                .font(.system(size: 16, weight: .regular))
                .padding(.horizontal, 15)
        }
    }
}
