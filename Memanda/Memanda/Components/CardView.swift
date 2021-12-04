//
//  CardView.swift
//  Memanda
//
//  Created by Thaís Fernandes on 01/12/21.
//

import SwiftUI

struct CardView: View {
    let source: String
    
    private let cardWidth = (153 * UIScreen.main.bounds.width) / 375

    var body: some View {
        Image(source)
             .resizable()
             .scaledToFill()
             .frame(width: cardWidth, height: 181)
             .cornerRadius(10)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(source: "0ac707b9bf11b852f6c00f8db27451aa")
    }
}
