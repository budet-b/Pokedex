//
//  PokemonDetailViewController.swift
//  Pokédex
//
//  Created by Benjamin_Budet on 03/11/2018.
//  Copyright © 2018 Benjamin Budet. All rights reserved.
//

import UIKit

class PokemonDetailViewController: UIViewController {

    var PokemonId = 0
    var pokemons: [Pokemon] = []
    
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var pokemonIdentifier: UILabel!
    @IBOutlet weak var pokemonType1: UILabel!
    @IBOutlet weak var pokemonType2: UILabel!
    @IBOutlet weak var pokemonHeight: UILabel!
    @IBOutlet weak var pokemonWidth: UILabel!
    @IBOutlet weak var pokemonDescription: UILabel!
    @IBOutlet weak var pokemonPreEvolutionText: UILabel!
    @IBOutlet weak var pokemonPreEvolutionOf: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokemonName.text = pokemons[PokemonId].name
        pokemonImage.sd_setImage(with: URL(string: "http://pokedex-mti.twitchytv.live/images/\(PokemonId + 1).png"), placeholderImage: UIImage(named: "pokeball"))
        self.title = pokemons[PokemonId].name
        pokemonIdentifier.text = "ID: \(PokemonId + 1)"
        pokemonType1.text = pokemons[PokemonId].type1.name
        pokemonType2.text = pokemons[PokemonId].type2?.name ?? ""
        pokemonHeight.text = pokemons[PokemonId].height
        pokemonWidth.text =  pokemons[PokemonId].weight
        pokemonDescription.text =  pokemons[PokemonId].description
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(PokemonId)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
