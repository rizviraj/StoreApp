//
//  ImageView.swift
//  StoresApp
//
//  Created by Mohamed Rizvi on 2022-09-05.
//

import SwiftUI

/*
    Use this view for downloading image
 */
struct ImageView: View {
    var imageUrl: String
    var body: some View {
        AsyncImage(url: URL(string: imageUrl)) { image in
            image.resizable()
        } placeholder: {
            Image("placeholder")
        }
    }
}

