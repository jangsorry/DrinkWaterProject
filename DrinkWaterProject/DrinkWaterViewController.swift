//
//  ViewController.swift
//  DrinkWaterProject
//
//  Created by 지성 on 2021/10/12.
//

import UIKit

class DrinkWaterViewController: UIViewController {

    
    @IBOutlet var resetButton: UIBarButtonItem!
    @IBOutlet var profileButton: UIBarButtonItem!
    
    
    @IBOutlet var textLabel: UILabel!
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var percentLabel: UILabel!
    
    @IBOutlet var mainImageView: UIImageView!
    @IBOutlet var waterTextField: UITextField!
    @IBOutlet var unitLabel: UILabel!
    
    @IBOutlet var infoLabel: UILabel!
    @IBOutlet var drinkButton: UIButton!
    
    
    //!-- viewDidLoda 위치 --!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.tintColor = .white
        
        UIsetting()
        labelUIDesign()
        waterdata()
     
    }
    
    
    func UIsetting() {
        self.title = "물마시기"
        self.view.backgroundColor = UIColor(red: 0/255, green: 151/255, blue: 112/255, alpha: 0.7)
        resetButton.image = UIImage(systemName: "arrow.clockwise")
        profileButton.image = UIImage(systemName: "person.circle")
    
    
    }
    
    func labelUIDesign() {
       
        //상단 UI
        textLabel.numberOfLines = 2
        textLabel.text = "잘하셨어요!\n오늘 마신 양은"
        textLabel.textColor = .white
        textLabel.font = .systemFont(ofSize: 20)
        textLabel.textAlignment = .left
        
        totalLabel.numberOfLines = 1
        totalLabel.textColor = .white
        totalLabel.font = .boldSystemFont(ofSize: 24)
        totalLabel.textAlignment = .left
        
        percentLabel.numberOfLines = 1
        percentLabel.textColor = .white
        percentLabel.font = .systemFont(ofSize: 16)
        percentLabel.textAlignment = .left
        
        
        
        //중간 UI
        
        waterTextField.placeholder = "0"
        waterTextField.textAlignment = .right
        waterTextField.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        waterTextField.textColor = .white
        
        unitLabel.text = "ml"
        unitLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        unitLabel.textColor = .white
        
        
        //하단 UI
        drinkButton.setTitle("물마시기", for: .normal)
        drinkButton.contentVerticalAlignment = .top
        drinkButton.backgroundColor = .white
        drinkButton.tintColor = .black
        
    }
    
    
    func waterdata() {
        percentLabel.text = "목표의 xx%"
        totalLabel.text = "총량ml"
        infoLabel.text = "xxx님의 하루 물 권장 섭취량은 xxxL 입니다."
        
        
    }
    
        
   
}

