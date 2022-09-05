//
//  BackButton.swift
//  StoresApp
//
//  Created by Mohamed Rizvi on 2022-09-05.
//

import SwiftUI

/*
    Use this view for back button in navigation bar
 */
struct BackButton: View {
    var presentationMode: Binding<PresentationMode>
    var body: some View {
        Button {
            self.presentationMode.wrappedValue.dismiss()
        } label: {
            Image("back")
                .frame(width: 50, height: 50)
                .background(Color(Constant.Color.darkBackground))
                .cornerRadius(15)
        }
    }
}


