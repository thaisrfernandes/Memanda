//
//  LargeTitleView.swift
//  Memanda
//
//  Created by Thaís Fernandes on 01/12/21.
//

import SwiftUI

struct LargeTitleView: View {
    let title: String
    let foregroundColor: Color?
    
    init(title: String) {
        self.title = title
        self.foregroundColor = Color("Primary")
    }
    
    init(title: String, foregroundColor: Color) {
        self.title = title
        self.foregroundColor = foregroundColor
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.heavy)
                .foregroundColor(foregroundColor)
        }
    }
}

struct LargeTitleView_Previews: PreviewProvider {
    static var previews: some View {
        LargeTitleView(title: "title")
    }
}
