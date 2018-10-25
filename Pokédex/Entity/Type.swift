//
//  Type.swift
//  Pokédex
//
//  Created by Benjamin_Budet on 25/10/2018.
//  Copyright © 2018 Benjamin Budet. All rights reserved.
//

import Foundation

struct PokemonType: Codable {
    var id: Int
    var name: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
    
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
//        name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
//    }
}
