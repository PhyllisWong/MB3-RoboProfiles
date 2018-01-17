//
//  RoboModel.swift
//  AppBundleReader
//
//  Created by djchai on 1/12/18.
//  Copyright © 2018 Eliel Gordon. All rights reserved.
//

import Foundation
import UIKit

//{
//    "name": "Xero",
//    "personality": "Cunning",
//    "image": "https://robohash.org/xero",
//    "phrase": "Please don't reload, I'll DIE!"
//}

struct Robot: Decodable {
    
    let name: String
    let personality: String
    let image: URL
    let phrase: String
    
}

