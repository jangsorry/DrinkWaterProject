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
        
        //view는 따로 위에 선언이 없어도 적용이 되는 것 같다..
        view.backgroundColor = UIColor(red: 0/255, green: 151/255, blue: 112/255, alpha: 0.7)
        UISetting()
        settinghoshiTextField()

       
    }
    
    func UISetting() {
        
     
        NavigationBarItem2.title = "저장"
    }
    
    func settinghoshiTextField() {
        nicknameTextField.font = .systemFont(ofSize: 20)
        nicknameTextField.placeholder = "닉네임을 설정해주세요"
        nicknameTextField.placeholderColor = .white
        nicknameTextField.textColor = .white
        nicknameTextField.borderStyle = .none
        nicknameTextField.borderActiveColor = .white
        
        
        heightTextField.font = .systemFont(ofSize: 20)
        heightTextField.placeholder = "키를 입력해주세요(cm)"
        heightTextField.placeholderColor = .white
        heightTextField.textColor = .white
        heightTextField.borderStyle = .none
        heightTextField.borderActiveColor = .white
        heightTextField.keyboardType = .numberPad
        
        
        weighTextField.font = .systemFont(ofSize: 20)
        weighTextField.placeholder = "몸무게를 입력해주세요(kg)"
        weighTextField.placeholderColor = .white
        weighTextField.textColor = .white
        weighTextField.borderStyle = .none
        weighTextField.borderActiveColor = .white
        weighTextField.keyboardType = .numberPad
        
        view.endEditing(true)
        
    }

    
    @IBAction func saveButtonClicked(_ sender: UIBarButtonItem) {
        let nickname = nicknameTextField.text
        UserDefaults.standard.set(nickname, forKey: "name")
        
        //더블타입으로 묶어줄때 옵셔널 경고떠서 그냥 강제해제하긴 했는데.. 이래도 되는 것인지 모르겠음..
        let heightValue : Double = Double(heightTextField.text!) ?? 160
        let weightValue : Double = Double(weighTextField.text!) ?? 50
        
        let total : Int = Int(heightValue + weightValue) * 10//
        UserDefaults.standard.set(total, forKey: "totalDrinkWater")
        
    }
    
    @IBAction func tapClicked(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    
}
