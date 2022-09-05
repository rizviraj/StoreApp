//
//  StoreListView.swift
//  StoresApp
//
//  Created by Mohamed Rizvi on 2022-09-05.
//

import SwiftUI

struct StoreListView: View {
    
    @StateObject private var viewModel = StoreListViewModel()
        
    init() {
        UITableView.appearance().showsVerticalScrollIndicator = false
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 15){
                StoreBannerView()
                
                //Filter store
                SearchView(search: $viewModel.search)
                
                CellTitleView()
                
                //Cell View
                if viewModel.isLoading {
                    LoadingView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                }else{
                    List(viewModel.storesArray) { store in
                        ZStack{
                            NavigationLink(destination:
                                    StoreDetailView(store: store)) {
                                EmptyView()
                                    .frame(height: 0)
                            }
                            .opacity(0.0)
                            .buttonStyle(PlainButtonStyle())
                            StoreCellView(store: store)
                                
                        }
                        .listRowSeparator(.hidden)
                    }
                    .listStyle(.plain)
                }
                Spacer()
            }
            .ignoresSafeArea(.all)
        }
        .onAppear{
            //Load store list
            viewModel.fetchStoreData()
        }
        .alert(item: $viewModel.alertItems){ items in
            Alert(title: items.title, message: items.message, dismissButton: items.alertButton)
        }
    }
}


struct StoreListView_Previews: PreviewProvider {
    static var previews: some View {
        StoreListView()
    }
}


struct SearchView: View {
    @Binding var search: String
    
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 20){
                Text("Select your new store")
                    .font(.system(size: 18, weight: .regular))
                    .foregroundColor(Color(Constant.Color.darkBrown))
                Text("SEARCH STORE")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(Color(Constant.Color.grayText))
            }
            Spacer()
            Image("close")
                .frame(width: 40, height: 40)
                .background(.black)
                .cornerRadius(10)
        }
        .padding(.horizontal, 15)
        
        TextField("Search", text: $search)
            .padding(.horizontal, 15)
            .frame(height: 40)
        Rectangle()
            .frame(height: 1.0, alignment: .bottom)
            .foregroundColor(Color(Constant.Color.blackText))
            .padding(.horizontal, 15)
    }
}

struct CellTitleView: View {
    var body: some View {
        Text("Other Stores")
            .font(.system(size: 16, weight: .regular))
            .foregroundColor(Color(Constant.Color.grayText))
            .padding(.horizontal, 15)
    }
}


