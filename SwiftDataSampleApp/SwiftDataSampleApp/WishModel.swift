//
//  WishModel.swift
//  SwiftDataSampleApp
//
//  Created by Naleen Dissanayake on 2026/01/15.
//

import Foundation
import SwiftData

@Model
class WishModel {
    var title: String
    
    init(title: String) {
        self.title = title
    }
}
