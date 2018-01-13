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

struct RoboProfile: Decodable {
    
    let name: String
    let personality: String
    let image: String
    let phrase: String
    
}

//extension RoboProfile: Decodable {
//    
//    enum RoboKeys: String, CodingKey {
//        case name
//        case personality
//        case image
//        case phrase
//    }
//    
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: RoboKeys.self)
//        let name = try container.decode(String.self, forKey: .name)
//        let personality = try container.decode(String.self, forKey: .personality)
//        let image = try container.decode(String.self, forKey: .image)
//        let phrase = try container.decode(String.self, forKey: .phrase)
//        
//        self.init(name: name, personality: personality, image: image, phrase: phrase)
//    }
//}
//
//enum UserKeys: String, CodingKey {
//    case username
//    case password
//}


