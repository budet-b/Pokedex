//
//  DetectAndConnectViewController.swift
//  Pokédex
//
//  Created by Benjamin_Budet on 09/11/2018.
//  Copyright © 2018 Benjamin Budet. All rights reserved.
//

import UIKit

class DetectAndConnectViewController: UIViewController {
    
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var statusConnection: UILabel!
    @IBOutlet weak var generatePokemonButton: UIButton!
    @IBOutlet weak var generatePokemonName: UILabel!
    @IBOutlet weak var generatePokemonImage: UIImageView!
    
    var GeneratedPokemon: PokemonArena?
    var connectedPeers = Set<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MultipeerService.shared.delegate = self
        generatePokemonName.text = ""
        // Do any additional setup after loading the view.
    }
    
    @IBAction func ConnectButtonPressed(_ sender: Any) {
        MultipeerService.shared.start(true)
        statusConnection.text = "Searching..."
    }
    
    
    @IBAction func DetectButtonPressed(_ sender: Any) {
        GeneratePokemon(completed: {(Pokemon) -> Void in
            self.GeneratedPokemon = Pokemon
            self.sendButton.isEnabled = true
            self.generatePokemonImage.sd_setImage(with: URL(string: "http://pokedex-mti.twitchytv.live/images/\(Pokemon.species.id).png"), placeholderImage: UIImage(named: "pokeball"))
            self.generatePokemonName.text = "\(Pokemon.species.name)"
            })
    }
    
    @IBAction func SendButtonPressed(_ sender: Any) {
        let mm: MultipeerMessage = MultipeerMessage(type: .sendCode, content: self.GeneratedPokemon)
        MultipeerService.shared.send(message: mm, to: Array(self.connectedPeers))
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

extension DetectAndConnectViewController: MultipeerServiceDelegate {

    func lostConnectedPeer(with name: String) {
        MultipeerService.shared.tryToConnect(to: name)
        print("lost \(name)")
    }
    
    func receive(code: String) {
        print("receive \(code)")
    }
    
    func found(peer name: String) {
        print("Found: \(name)")
    }
    
    func peerDidConnect(with name: String) {
        DispatchQueue.main.async {
            self.statusConnection.text = "Connected to \(name)"
            self.generatePokemonButton.isEnabled = true
            self.connectedPeers.insert(name)
        }
    }
}
