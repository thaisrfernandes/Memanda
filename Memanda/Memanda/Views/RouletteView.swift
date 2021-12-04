//
//  RouletteView.swift
//  Memanda
//
//  Created by Thaís Fernandes on 02/12/21.
//

import Foundation
import SwiftUI

struct RouletteView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var data: ComposeMessageData
    
    @State private var showMailView = false
    @State private var showAnimation = true
    @State private var backgroundColor = Color("Background")
    @State private var willSendMessage = false
    
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea()
            
            if showAnimation {
                AnimatedRouletteView()
            }
            
            if !showAnimation && !showMailView {
                StatusView(onClose: {
                    presentationMode.wrappedValue.dismiss()
                    ContactsModel.shared.loadContacts()
                }, status: StatusModel(isSuccessful: willSendMessage))
            }
            
        }
        .onAppear {
            print(ContactsModel.shared.numbers)
            withAnimation(.linear.delay(4.0)) {
                self.willSendMessage = ContactsModel.shared.numbers.isEmpty ? false : Bool.random()
                
                if willSendMessage {
                    self.backgroundColor = Color("Primary")
                    
                } else {
                    self.backgroundColor = Color("Secondary")
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 4.5) {
                if willSendMessage {
                    self.showMailView.toggle()
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                withAnimation {
                    self.showAnimation.toggle()
                }
            }
        }
        .sheet(isPresented: $showMailView) {
            MessageView(data: $data)
        }
        
    }
    
}
