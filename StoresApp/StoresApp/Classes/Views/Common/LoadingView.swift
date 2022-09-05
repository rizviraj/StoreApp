//
//  LoadingView.swift
//  StoresApp
//
//  Created by Mohamed Rizvi on 2022-09-05.
//

import SwiftUI

/*
    Loading indicator
 */
struct LoadingView: View {
    var body: some View {
        ZStack {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .gray))
                .scaleEffect(5)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
