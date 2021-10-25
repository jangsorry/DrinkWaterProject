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
        
    
    //텍스트필드는 userDefault로 저장한다음, 값을 가져오면 될 거 같고, 그 다음에 해당정보를 앞에 넘겨줘야할 듯..
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UISetting()

       
    }
    
    func UISetting() {
        
        self.view.backgroundColor = UIColor(red: 0/255, green: 151/255, blue: 112/255, alpha: 0.7)
        
        NavigationBarItem2.title = "저장"
    }

}
