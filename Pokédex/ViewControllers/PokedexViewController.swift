//
//  PokedexViewController.swift
//  Pokédex
//
//  Created by Benjamin_Budet on 02/11/2018.
//  Copyright © 2018 Benjamin Budet. All rights reserved.
//

import UIKit
import SDWebImage

class PokedexViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var pokedexTableView: UITableView!
    var pokemons: [Pokemon] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokedexTableView.delegate = self
        pokedexTableView.dataSource = self
        GetPokemons(completed: self.updateUI)
        // Do any additional setup after loading the view.
    }
    
    func updateUI(pokemonsData: [Pokemon]) {
        pokemons = pokemonsData
        pokedexTableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pokemondetail" {
            if let vc = segue.destination as? PokemonDetailViewController {
                vc.PokemonId = (self.pokedexTableView.indexPathForSelectedRow?.row ?? 0)
                vc.pokemons = pokemons
            }
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonCell", for: indexPath) as! PokemonTableViewCell
        cell.pokemonName.text = pokemons[indexPath.row].name
        cell.pokemonImage.sd_setImage(with: URL(string: "http://pokedex-mti.twitchytv.live/images/\(indexPath.row + 1).png"), placeholderImage: UIImage(named: "pokeball"))
        cell.pokemonType1.backgroundColor = getColorFromType(type: pokemons[indexPath.row].type1.id)
        cell.pokemonType1.text = pokemons[indexPath.row].type1.name
        cell.pokemonType1.layer.cornerRadius = cell.pokemonType1.frame.size.height / 2
        cell.pokemonType1.clipsToBounds = true
        cell.pokemonType1.textColor = UIColor.white
        
        if let type2 = pokemons[indexPath.row].type2 {
            cell.pokemonType2.backgroundColor = getColorFromType(type: type2.id)
            cell.pokemonType2.text = type2.name
            cell.pokemonType2.layer.cornerRadius = cell.pokemonType2.frame.size.height / 2
            cell.pokemonType2.clipsToBounds = true
            cell.pokemonType2.textColor = UIColor.white
        } else {
            cell.pokemonType2.text = ""
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
