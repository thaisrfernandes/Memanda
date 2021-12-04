//
//  ContentView.swift
//  Memanda
//
//  Created by Thaís Fernandes on 01/12/21.
//

import SwiftUI

struct MemesView: View {
    private var columns: [GridItem] = [
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0)
    ]
    
    private let imgs = MemesModel().imageSources
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(0..<imgs.count, id: \.self) { index in
                    NavigationLink(destination: SendView(imgSource: imgs[index])) {
                        CardView(source: imgs[index])
                    }
                }
            }
        }
        .padding(.top, -20)
        .padding(.horizontal, 16)
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                LargeTitleView(title: "Memes")
            }
        }
        .accentColor(Color(UIColor.systemBackground))
    
    }
}

struct MemesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MemesView()
        }
        .preferredColorScheme(.dark)
        .previewDevice("iPhone 12")
    }
}
