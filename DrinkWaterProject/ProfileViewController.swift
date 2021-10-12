//
//  ProfileViewController.swift
//  DrinkWaterProject
//
//  Created by 지성 on 2021/10/12.
//

import UIKit
import TextFieldEffects

class ProfileViewController: UIViewController {

    
    @IBOutlet var imageView: UIImageView!
    
    
    @IBOutlet var nicknameTextField: HoshiTextField!
    @IBOutlet var heightTextField: HoshiTextField!
    @IBOutlet var weighTextField: HoshiTextField!
        
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.tintColor = .white
    }
    

}
