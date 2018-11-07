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
    
    @IBOutlet weak var evolutionView: UIView!
    @IBOutlet weak var preEvolutionConstraint: NSLayoutConstraint!
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
        pokemonType1.backgroundColor = getColorFromType(type: pokemon?.type1.id ?? 0)
        pokemonType1.layer.cornerRadius = pokemonType1.frame.size.height / 2
        pokemonType1.clipsToBounds = true
        pokemonType1.textColor = UIColor.white
        
        if let type2 = pokemon?.type2 {
            pokemonType2.backgroundColor = getColorFromType(type: type2.id)
            pokemonType2.text = type2.name
            pokemonType2.layer.cornerRadius = pokemonType2.frame.size.height / 2
            pokemonType2.clipsToBounds = true
            pokemonType2.textColor = UIColor.white
        } else {
            pokemonType2.text = ""
            pokemonType2.backgroundColor = UIColor.white
        }
        if let pre_evol = pokemon?.preEvolutionId {
            pokemonPreEvolutionOf.sd_setImage(with: URL(string: "http://pokedex-mti.twitchytv.live/images/\(pre_evol).png"), placeholderImage: UIImage(named: "pokeball"))
        } else {
            evolutionView.isHidden = true
            pokemonPreEvolutionText.text = ""
            pokemonPreEvolutionOf.image = nil
            preEvolutionConstraint.constant = 0
            self.view.layoutIfNeeded()
        }
        
        // Do any additional setup after loading the view.
    }
}
