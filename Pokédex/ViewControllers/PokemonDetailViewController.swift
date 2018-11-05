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
    var pokemon: Pokemon?
    
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
        pokemonName.text = pokemon?.name
        pokemonImage.sd_setImage(with: URL(string: "http://pokedex-mti.twitchytv.live/images/\(PokemonId).png"), placeholderImage: UIImage(named: "pokeball"))
        self.title = pokemon?.name
        pokemonIdentifier.text = "ID: \(PokemonId)"
        pokemonType1.text = pokemon?.type1.name
        pokemonType2.text = pokemon?.type2?.name ?? ""
        pokemonHeight.text = pokemon?.height
        pokemonWidth.text =  pokemon?.weight
        pokemonDescription.text =  pokemon?.description
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
