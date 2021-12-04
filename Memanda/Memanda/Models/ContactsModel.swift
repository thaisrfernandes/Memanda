//
//  ContactsModel.swift
//  Memanda
//
//  Created by Thaís Fernandes on 01/12/21.
//

import Contacts
import ContactsUI
import SwiftUI

class ContactsModel {
    static let shared = ContactsModel()
    
    var isAuthorized: Bool = false
    
    private init() {
        loadContacts()
    }
    
    func getRandomNumber() -> String {
        if let randomNumber = numbers.randomElement() {
            return randomNumber
        }
        return numbers[0]
    }
    
    var numbers: [String] = []
    
    func loadContacts() {
        let keys = [CNContactPhoneNumbersKey] as [CNKeyDescriptor]
        let request = CNContactFetchRequest(keysToFetch: keys)
        let contactStore = CNContactStore()
        
        if !isAuthorized {
            requestAccess()
        }
                
        if isAuthorized {
            do {
                try contactStore.enumerateContacts(with: request) {
                    (contact, stop) in
                    let phoneNumber = contact.phoneNumbers
                    
                    if phoneNumber.count > 0 {
                        self.numbers.append(phoneNumber[0].value.stringValue)
                    }
                }
                
            } catch {
                print("unable to fetch contacts")
            }
        } 
    }
    
    func requestAccess() {
        let store = CNContactStore()
        switch CNContactStore.authorizationStatus(for: .contacts) {
            case .authorized:
                self.isAuthorized = true
                
            case .denied:
                store.requestAccess(for: .contacts) { granted, error in
                    if granted {
                        self.isAuthorized = true
                    }
                }
                
            case .restricted, .notDetermined:
                store.requestAccess(for: .contacts) { granted, error in
                    if granted {
                        self.isAuthorized = true
                    }
                }
                
            @unknown default:
                self.isAuthorized = false
        }
    }
}
