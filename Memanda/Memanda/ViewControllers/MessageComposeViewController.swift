//
//  MessageComposeViewController.swift
//  Memanda
//
//  Created by Thaís Fernandes on 02/12/21.
//

struct ComposeMessageData {
    let attachmentSource: String
}

struct AttachmentData {
    let data: Data
    let mimeType: String
    let fileName: String
}

import SwiftUI
import UIKit
import MessageUI
import Foundation

struct MessageView: UIViewControllerRepresentable {
    @Environment(\.presentationMode) var presentation
    @Binding var data: ComposeMessageData
    
    class Coordinator: NSObject, MFMessageComposeViewControllerDelegate {
        @Binding var presentation: PresentationMode
        @Binding var data: ComposeMessageData
        
        init(presentation: Binding<PresentationMode>,
             data: Binding<ComposeMessageData>) {
            _presentation = presentation
            _data = data
        }
        
        func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
            
            $presentation.wrappedValue.dismiss()
            
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(presentation: presentation, data: $data)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<MessageView>) -> MFMessageComposeViewController {
        let controller = MFMessageComposeViewController()

        if (MFMessageComposeViewController.canSendText()) {
            
            controller.messageComposeDelegate = context.coordinator

            controller.body = ""
            
            if MFMessageComposeViewController.canSendAttachments() {
                
                if let image = UIImage(named: data.attachmentSource),
                    let dataImage = image.jpegData(compressionQuality: 1) {
                    
                    controller.addAttachmentData(dataImage, typeIdentifier: "image/jpeg", filename: "\(data.attachmentSource).jpg")
                }
            }
            
//            if let randomNumber = ContactsModel.shared.numbers.randomElement() {
//                controller.recipients = [randomNumber]
//            }
            controller.recipients = ["+55 (51) 8450-3688"]
        }
        return controller
    }
    
    func updateUIViewController(_ uiViewController: MFMessageComposeViewController, context: UIViewControllerRepresentableContext<MessageView>) {
    }
    
    static var canSendMessage: Bool {
        MFMessageComposeViewController.canSendText()
    }
}
