//
//  LoadingView.swift
//  SwiftUI Starter
//
//  Created by Brad Kang on 2021-10-06.
//

import SwiftUI

struct LoadingView: View {
    
    let text: String
    
    var body: some View {
        VStack(spacing: 8) {
            ProgressView()
            Text(text)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(text: "Fetching Quotes")
    }
}
