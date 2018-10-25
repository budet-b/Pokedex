//
//  Pokemon.swift
//  Pokédex
//
//  Created by Benjamin_Budet on 25/10/2018.
//  Copyright © 2018 Benjamin Budet. All rights reserved.
//

import Foundation

struct Pokemon: Codable {
    public var id: Int
    public var name: String
    public var pokedexNumber: Int
    public var height: String
    public var weight: String
    public var description: String
    public var preEvolutionId: Int?
    public var type1: PokemonType
    public var type2: PokemonType?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case pokedexNumber = "pokedex_number"
        case height
        case weight
        case description
        case preEvolutionId = "pre_evolution_id"
        case type1
        case type2
    }
    
//        init(from decoder: Decoder) throws {
////            let container = try decoder.container(keyedBy: CodingKeys.self)
////            id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
////            name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
////            pokedex_number = try container.decodeIfPresent(Int.self, forKey: .pokedex_number) ?? 0
////            height = try container.decodeIfPresent(Float.self, forKey: .height) ?? 0.0
////            weight = try container.decodeIfPresent(Float.self, forKey: .weight) ?? 0.0
////            description = try container.decodeIfPresent(String.self, forKey: .description) ?? ""
////            pre_evolution_id = try container.decodeIfPresent(Int.self, forKey: .pre_evolution_id) ?? 0
////            type1 = try container.decodeIfPresent(PokemonType.self, forKey: .type1)
////            type2 = try container.decodeIfPresent(PokemonType.self, forKey: .type2)
//        }
    
}
