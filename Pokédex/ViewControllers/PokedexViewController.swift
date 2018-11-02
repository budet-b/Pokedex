//
//  PokedexViewController.swift
//  Pokédex
//
//  Created by Benjamin_Budet on 02/11/2018.
//  Copyright © 2018 Benjamin Budet. All rights reserved.
//

import UIKit

class PokedexViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var pokedexTableView: UITableView!
    var pokemons: [Pokemon] = []
    var pokemonImages: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokedexTableView.delegate = self
        pokedexTableView.dataSource = self
        GetPokemons(completed: self.updateUI)
        GetPokemonsImages(from: 1, to: 75, completed: self.updateUIImages)
        // Do any additional setup after loading the view.
    }
    
    func updateUI(pokemonsData: [Pokemon]) {
        pokemons = pokemonsData
    }
    
    func updateUIImages(images: [UIImage]) {
        pokemonImages = images
        pokedexTableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        GetPokemonsImages(from: 76, to: 151, completed: self.updateUIImages2)
    }
    
    func updateUIImages2(images: [UIImage]) {
        pokemonImages += images
        pokedexTableView.reloadData()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonCell", for: indexPath) as! PokemonTableViewCell
        cell.pokemonName.text = pokemons[indexPath.row].name
        cell.pokemonImage.image = pokemonImages[indexPath.row]
        cell.pokemonType1.text = pokemons[indexPath.row].type1.name
        cell.pokemonType2.text = pokemons[indexPath.row].type2?.name ?? "No type2"
        return cell
    }
}
