//
//  SendView.swift
//  Memanda
//
//  Created by Thaís Fernandes on 02/12/21.
//

import SwiftUI

struct SendView: View {
    let imgSource: String
    
    @State private var openedRoulette = false
    
    let cardWidth = getWidth(for: 329)
    
    var body: some View {
        ZStack {
            Color("SecondaryBackground")
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    LargeTitleView(title: "Mandar Memes", foregroundColor: Color("Auxiliary"))
                    Spacer()
                }
                .padding(.top, (-50 * UIScreen.main.bounds.height) / 844)
                
                Spacer()
                
                VStack {
                    Image(imgSource)
                        .resizable()
                        .scaledToFit()
                        .frame(width: cardWidth/1.2)
                }
                .frame(width: cardWidth, height: getHeight(for: 345), alignment: .center)
                .background(Color("CardBackground"))
                .cornerRadius(22)
                .padding(.bottom, 80)
                
                Button(action: {
                    
                  self.openedRoulette.toggle()
                    
                }, label: {
                    VStack {
                        Text("Mandar")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.primary)
                            .padding()
                    }
                    .frame(width: getWidth(for: 174), height: getHeight(for: 38))
                    .background(Color("CardBackground"))
                    .cornerRadius(6)
                })
                .disabled(!MessageView.canSendMessage)
                .fullScreenCover(isPresented: $openedRoulette) {
                    RouletteView(data: ComposeMessageData(attachmentSource: imgSource))
                }
                
                Spacer()
            }
            .padding(.horizontal, 16)
        }
        .foregroundColor(Color(UIColor.systemBackground))
        .accentColor(Color("Auxiliary"))
        .onAppear {
            ContactsModel.shared.loadContacts()
        }
    }
}
