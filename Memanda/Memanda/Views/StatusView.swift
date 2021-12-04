//
//  SuccessfulView.swift
//  Memanda
//
//  Created by Thaís Fernandes on 02/12/21.
//

import SwiftUI

struct StatusView: View {
    var onClose: () -> Void
    var status: StatusModel
    
    let foregroundColor = Color(UIColor.systemBackground)
    
    var body: some View {
        ZStack(alignment: .center) {
            status.backgroundColor
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Button(action: onClose) {
                    HStack {
                        Spacer()
                        Image(systemName: "xmark")
                        .foregroundColor(foregroundColor)
                        .font(.system(.title, design: .rounded))
                    }
                }
                
                Spacer()
                
                Image(status.imageSource)
                    .padding(.bottom, 80)
                
                Text(status.title)
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.heavy)
                    .foregroundColor(foregroundColor)
                    .multilineTextAlignment(.center)
                
                Spacer()
            }
            .padding(.horizontal, 16)
        }
//        .toolbar {
//            ToolbarItem(placement: .navigationBarLeading) {
//                Button(action: onClose) {
//                    Image("close.fill")
//                }
//            }
//        }
        
    }
}

struct StatusView_Previews: PreviewProvider {
    static var previews: some View {
        StatusView(onClose: { print("oi") }, status: StatusModel(isSuccessful: true))
    }
}
