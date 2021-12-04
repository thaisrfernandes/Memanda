//
//  helpers.swift
//  Memanda
//
//  Created by Thaís Fernandes on 01/12/21.
//

import Foundation
import UIKit

let width = UIScreen.main.bounds.width
let height = UIScreen.main.bounds.height

func getWidth(for width: Double) -> Double {
    //return (375 / width) * UIScreen.main.bounds.width
    return (width * UIScreen.main.bounds.width) / 375
}

func getHeight(for height: Double) -> Double {
    //return (812 / height) * UIScreen.main.bounds.height
    return (height * UIScreen.main.bounds.height) / 812
}
