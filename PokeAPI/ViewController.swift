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

class ViewController: UIViewController {
    
    @IBOutlet weak var pokemonNameTextField: UITextField!
    @IBOutlet weak var pokeRetrieveButton: UIButton!
    @IBOutlet weak var infoTextView: UITextView!
    
    let pokemonAPIBaseURL = "https://pokeapi.co/api/v2/"
    
    @IBAction func pokeRetrieveTapped(_ sender: Any) {
        pokemonNameTextField.resignFirstResponder()
        
        guard let pokemonName = pokemonNameTextField.text else {
            return
        }
        
        pokemonNameTextField.text = ""
        
        let pokemonNameURLComponent = pokemonName.replacingOccurrences(of: " ", with: "+")
        
        let requestURL = pokemonAPIBaseURL + pokemonNameURLComponent
        
        Alamofire.request(requestURL).responseJSON { (response) in
            
            
            
        }
        
        
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    
    
    


}

