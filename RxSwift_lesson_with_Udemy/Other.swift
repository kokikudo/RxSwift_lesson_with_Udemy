//
//  Other.swift
//  RxSwift_lesson_with_Udemy
//
//  Created by kudo koki on 2022/05/07.
//

import Foundation
import UIKit
import ChameleonFramework

struct CellInfo {
    static let reuseIdentifier = "ColorCell"
}

struct Colour {
    let name: String
    let color: UIColor

    init(name: String, color: UIColor) {
        self.name = name
        self.color = color
    }
}
