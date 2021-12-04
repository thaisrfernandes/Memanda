//
//  MemesModel.swift
//  Memanda
//
//  Created by Thaís Fernandes on 03/12/21.
//

import Foundation

class MemesModel {
    var imageSources: [String] = []
    
    init() {
        loadMemes()
    }
    
    func loadMemes() {
        (0...7).forEach { n in
            let randomN = Int.random(in: 1...43)
            self.imageSources.append("meme\(randomN)")
        }
    }
}
