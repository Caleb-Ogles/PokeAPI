//
//  AllPokemonViewController.swift
//  PokeAPI
//
//  Created by Caleb Ogles on 11/14/18.
//  Copyright © 2018 Caleb Ogles. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class AllPokemonViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var pokemonNameTableView: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonCell")
        cell?.textLabel?.text = pokemonNames[indexPath.row]
        return cell!
    }
    
    
    //Array to hold on the pokemon names that you get back from the api
    var pokemonNames = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        let url = "https://pokeapi.co/api/v2/pokemon/"
        
        let request = Alamofire.request(url)
        
        request.responseJSON { (response) in
            switch response.result {
            case .success(let value):
                print(value)
                //Convert our response JSON into a SwiftyJSON JSON object
                let json = JSON(value)
                
                if let results = json["results"].array {
                    for result in results {
                        if let pokemonName = result["name"].string {
                            print(pokemonName)
                            self.pokemonNames.append(pokemonName.capitalized)
                        }
                    }
                    self.pokemonNameTableView.reloadData()
                    
                }
                
                
            case .failure(let error):
                print(error.localizedDescription)
                
            }
            
        }
        
        
        
    }

}
