//
//  ViewController.swift
//  PokeAPI
//
//  Created by Caleb Ogles on 11/12/18.
//  Copyright © 2018 Caleb Ogles. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SDWebImage

class ViewController: UIViewController {
    
    @IBOutlet weak var pokemonNameTextField: UITextField!
    @IBOutlet weak var pokeRetrieveButton: UIButton!
    @IBOutlet weak var infoTextView: UITextView!
    @IBOutlet weak var pokemonImageView: UIImageView!
    
    let pokemonAPIBaseURL = "https://pokeapi.co/api/v2/pokemon/"
    
    @IBAction func pokeRetrieveTapped(_ sender: Any) {
        pokemonNameTextField.resignFirstResponder()
        
        guard let pokemonName = pokemonNameTextField.text else {
            return
        }
        
        pokemonNameTextField.text = ""
        
        let pokemonNameURLComponent = pokemonName.replacingOccurrences(of: " ", with: "+")
        
        let requestURL = pokemonAPIBaseURL + pokemonNameURLComponent + "/"
        
        let placeholderImage =
        
        Alamofire.request(requestURL).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                self.infoTextView.text = json["name"].stringValue
                self.pokemonImageView.sd_setImage(with: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(json["id"].stringValue).png" ), placeholderImage: UIImage(named: "placeholder.png"))
                
                
            case .failure(let error):
                self.infoTextView.text = "Invalid ID or name, please try again!!"
                print(error.localizedDescription)
            }
            
        }
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

}

