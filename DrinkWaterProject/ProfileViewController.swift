//
//  ProfileViewController.swift
//  DrinkWaterProject
//
//  Created by 지성 on 2021/10/12.
//

import UIKit
import TextFieldEffects

class ProfileViewController: UIViewController {

    
    @IBOutlet var NavigationBarItem2: UIBarButtonItem!
   
    @IBOutlet var imageView: UIImageView!
    
    
    @IBOutlet var nicknameTextField: HoshiTextField!
    @IBOutlet var heightTextField: HoshiTextField!
    @IBOutlet var weighTextField: HoshiTextField!
        
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UISetting()

       
    }
    
    func UISetting() {
        
        self.view.backgroundColor = UIColor(red: 0/255, green: 151/255, blue: 112/255, alpha: 0.7)
        
        
        NavigationBarItem2.title = "저장"
    }

}
