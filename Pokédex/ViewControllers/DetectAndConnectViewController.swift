//
//  DetectAndConnectViewController.swift
//  Pokédex
//
//  Created by Benjamin_Budet on 09/11/2018.
//  Copyright © 2018 Benjamin Budet. All rights reserved.
//

import UIKit

class DetectAndConnectViewController: UIViewController {

    @IBOutlet weak var detectedDevicesTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MultipeerService.shared.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func ConnectButtonPressed(_ sender: Any) {
        MultipeerService.shared.start(true)
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

//extension DetectAndConnectViewController: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return MultipeerService.shared.
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//
//
//}

extension DetectAndConnectViewController: MultipeerServiceDelegate {

    func lostConnectedPeer(with name: String) {
        print("lost")
    }
    
    func receive(code: String) {
        print("receive \(code)")
    }
    
    func found(peer name: String) {
        print("Found: \(name)")
    }
    
    func peerDidConnect(with name: String) {
        print("\(name)")
    }
}
