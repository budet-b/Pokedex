//
//  PokemonMLViewController.swift
//  Pokédex
//
//  Created by Benjamin_Budet on 05/11/2018.
//  Copyright © 2018 Benjamin Budet. All rights reserved.
//

import UIKit
import CoreML
import Vision

class PokemonMLViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var pokemonResLabel: UILabel!
    @IBOutlet weak var pokemonImageRes: UIImageView!
    
    let imagePicker = UIImagePickerController()
    let imagePickerCamera = UIImagePickerController()
    var pokemons: [Pokemon] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GetPokemons(completed: self.updateArray)
        imagePicker.allowsEditing = false
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary

        // Do any additional setup after loading the view.
    }
    
    func analyzeImage(_ uiImage: UIImage) {
        guard let ciImage = CIImage(image: uiImage) else {
            fatalError("Can't create CIImage from UIImage")
        }
        
        DispatchQueue.global(qos: DispatchQoS.QoSClass.userInitiated).async {
            let handler = VNImageRequestHandler(ciImage: ciImage)
            try? handler.perform([self.classificationRequest])
        }
    }
    
    lazy var classificationRequest: VNCoreMLRequest = {
        do {
            let model = try VNCoreMLModel(for: ImageClassifier().model)
            return VNCoreMLRequest(model: model, completionHandler: self.handleClassification)
        } catch {
            fatalError("Can't load Vision ML model: \(error)")
        }
    }()
    
    func handleClassification(request: VNRequest, error: Error?) {
        guard let observations = request.results as? [VNClassificationObservation]
            else { fatalError("Unexpected result type from VNCoreMLRequest") }
        
        guard let best = observations.first
            else { fatalError("Can't get best result") }
        
        DispatchQueue.main.async {
            self.resultLabel.text = "I think I found something:"
            let res: Pokemon = self.pokemons[(Int(best.identifier) ?? 1) - 1]
            self.pokemonResLabel.text = "It's \(res.name)"
            self.pokemonImageRes.sd_setImage(with: URL(string: "http://pokedex-mti.twitchytv.live/images/\(best.identifier).png"), placeholderImage: UIImage(named: "pokeball"))
        }
    }
    
    
    
    @IBAction func openPicture(_ sender: Any) {
        self.resultLabel.text = nil
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func openCamera(_ sender: Any) {
        self.resultLabel.text = nil
        imagePickerCamera.delegate = self
        imagePickerCamera.sourceType = .camera
        present(imagePickerCamera, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            analyzeImage(pickedImage)
        }
        dismiss(animated: true, completion: nil)
    }
    
    func updateArray(pokemonsData: [Pokemon]) {
        pokemons = pokemonsData
    }
}
