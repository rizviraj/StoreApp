//
//  StoreBannerView.swift
//  StoresApp
//
//  Created by Mohamed Rizvi on 2022-09-05.
//

import SwiftUI

struct StoreBannerView: View {
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image("stores")
                .resizable()
                .frame(width: UIScreen.main.bounds.width, height: 280)
                .opacity(0.9)
            
            VStack(alignment: .trailing){
                HStack(spacing: 20){
                    Image("search")
                        .frame(width: 40, height: 40)
                        .background(Color(Constant.Color.darkBrown))
                        .cornerRadius(10)
                    Image("cart")
                        .frame(width: 40, height: 40)
                        .background(.white)
                        .cornerRadius(10)
                }
                .padding(.bottom, 100)
                .padding(.horizontal, 20)
                
                HStack{
                    VStack(alignment: .leading){
                        Text("Points")
                            .font(.system(size: 18, weight: .regular))
                            .foregroundColor(Color(Constant.Color.grayText))
                        Text("37,643")
                            .font(.system(size: 44, weight: .bold))
                            .foregroundColor(Color(Constant.Color.darkBrown))
                    }
                    Spacer()
                    HStack(spacing: 10){
                        Text("View Stamps")
                            .font(.system(size: 18, weight: .regular))
                            .foregroundColor(Color(Constant.Color.grayText))
                            .frame(width: 100, alignment: .trailing)
                            .lineLimit(2)
                        Image("star")
                            .frame(width: 40, height: 40)
                            .background(Color(Constant.Color.darkBackground))
                            .cornerRadius(10)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
            }
        }
    }
}

struct StoreBannerView_Previews: PreviewProvider {
    static var previews: some View {
        StoreBannerView()
    }
}
