//
//  PokemonService.swift
//  Pokédex
//
//  Created by Benjamin_Budet on 25/10/2018.
//  Copyright © 2018 Benjamin Budet. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage
import UIKit

func GetPokemons(completed: @escaping ([Pokemon]) -> ()) {
    let headers: HTTPHeaders = [
        "Accept": "application/json"
    ]
    let urlPokemon = "http://pokedex-mti.twitchytv.live/species"
    let url = URL(string: urlPokemon)
    var pokemonsRes : [Pokemon] = []
    Alamofire.request(url!, method: .get, headers: headers)
        .validate(statusCode: 200..<300)
        .responseData(completionHandler: {
            response in
            switch response.result {
            case .success(let data):
                print(response.result)
                do {
                    pokemonsRes = try JSONDecoder().decode([Pokemon].self, from: data)
                    DispatchQueue.main.async {
                        completed(pokemonsRes)
                    }
                } catch {
                    print("error")
                }
            case .failure:
                print("error")
            }
    })
}

func GetPokemonsImages(from: Int, to: Int, completed: @escaping ([UIImage]) -> ()) {
    var images : [UIImage] = []
    for i in from...to {
        let urlPokemon = "http://pokedex-mti.twitchytv.live/images/\(i).png"
        let url = URL(string: urlPokemon)
        Alamofire.request(url!).responseImage { response in
            if let image = response.result.value {
                images.append(image)
                completed(images)
            }
        }
    }
}
