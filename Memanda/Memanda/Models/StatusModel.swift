//
//  StatusModel.swift
//  Memanda
//
//  Created by Thaís Fernandes on 02/12/21.
//

import Foundation
import SwiftUI

enum Status {
    case successful
    case unsuccessful
}

struct StatusModel {
    let title: String
    let backgroundColor: Color
    let imageSource: String
    
    init(isSuccessful: Bool) {
        switch isSuccessful {
            case true:
                self.title = "Meme mandado!"
                self.backgroundColor = Color("Primary")
                self.imageSource = "Successful"
                return
                
            case false:
                self.title = "Meme não foi\nmandado!"
                self.backgroundColor = Color("Secondary")
                self.imageSource = "Unsuccessful"
                return
        }
    }
}


