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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GetPokemons(completed: self.updateUI)
        pokedexTableView.delegate = self
        pokedexTableView.dataSource = self
        pokedexTableView.reloadData()
        // Do any additional setup after loading the view.
    }
    
    func updateUI(pokemonsData: [Pokemon]) {
        pokemons = pokemonsData
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonCell", for: indexPath) as! UITableViewCell
        cell.textLabel?.text = pokemons[indexPath.row].name
        return cell
    }
}
