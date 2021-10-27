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
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.tintColor = .white
        
        //컬러는 포토샵 스포이드로 뽑은 후 -> rgb값 뽑아서 -> 컬러 적용
        view.backgroundColor = UIColor(red: 0/255, green: 151/255, blue: 112/255, alpha: 0.7)
        
        NavUIsetting()
        labelUIDesign()
        setWaterDataTextField()
       
        onedayWaterLabel()
        todayTotalmlLabel()
        goalPercentLabel()
        growMainImageView()
        
       
    }
    
    func NavUIsetting() {
        self.title = "물마시기"
        view.backgroundColor = UIColor(red: 0/255, green: 151/255, blue: 112/255, alpha: 0.7)
        resetButton.image = UIImage(systemName: "arrow.clockwise")
        profileButton.image = UIImage(systemName: "person.circle")
    }
    
    func labelUIDesign() {
       
        //상단 UI
        textLabel.numberOfLines = 2
        textLabel.text = "잘하셨어요!\n오늘 마신 양은"
        textLabel.textColor = .white
        textLabel.font = .systemFont(ofSize: 24)
        textLabel.textAlignment = .left
        
        totalLabel.numberOfLines = 1
        totalLabel.textColor = .white
        totalLabel.font = .boldSystemFont(ofSize: 24)
        totalLabel.textAlignment = .left
    
        
        //중간 UI
        unitLabel.text = "ml"
        unitLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        unitLabel.textColor = .white
        infoLabel.font = .systemFont(ofSize: 14)
        infoLabel.textAlignment = .center
        
        //하단 UI 버튼
        drinkButton.setTitle("물마시기", for: .normal)
        drinkButton.contentVerticalAlignment = .center
        drinkButton.titleLabel?.font = .systemFont(ofSize: 20)
        drinkButton.contentVerticalAlignment = .top
        drinkButton.tintColor = .black
        drinkButton.backgroundColor = .white
        
        
    }
    
    
    func setWaterDataTextField() {
        waterTextField.placeholder = "0"
        waterTextField.keyboardType = .numberPad
        waterTextField.borderStyle = .line
        //색상값이 배경이랑 동일한데, 화면상에서는 다르게 나옴.. 여쭤봐야 할 듯
        waterTextField.backgroundColor = UIColor(red: 0/255, green: 151/255, blue: 112/255, alpha: 0.7)
        waterTextField.textColor = .white
        waterTextField.textAlignment = .right
        waterTextField.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        waterTextField.clearButtonMode = .always
        
        view.endEditing(true)
        
    }
    
    //좌측 상단 목표 퍼센트 label
    func goalPercentLabel() {
        let total = UserDefaults.standard.integer(forKey: "totalDrinkWater")
        let todayRecommandWater = UserDefaults.standard.integer(forKey: "totalDrinkWater")
        
        //0일때 여기서 오류 발생...
        let percent = todayRecommandWater * 100 / total
        UserDefaults.standard.set(percent, forKey: "percentage") //저장
        let totalpercent = UserDefaults.standard.integer(forKey: "percentage")
        percentLabel.text = "목표의\(totalpercent)%"
        
        if percent >= 100 {
            percentLabel.textColor = .blue
            percentLabel.font = .systemFont(ofSize: 18)
            percentLabel.numberOfLines = 1
            percentLabel.textAlignment = .left
        } else {
            percentLabel.textColor = .white
            percentLabel.font = .systemFont(ofSize: 18)
            percentLabel.numberOfLines = 1
            percentLabel.textAlignment = .left
        }

        
    }
    //오늘 마신 양
    func todayTotalmlLabel() {
        totalLabel.text = "\(UserDefaults.standard.integer(forKey: "totalDrinkWater"))ml"
    }
        
     //메인 이미지 구분
    func growMainImageView() {
            let totalpercent = UserDefaults.standard.integer(forKey: "percentage")
            
            switch totalpercent{
            case 0...10: mainImageView.image = UIImage(named: "1-1")
            case 11...20: mainImageView.image = UIImage(named: "1-2")
            case 21...30: mainImageView.image = UIImage(named: "1-3")
            case 31...40: mainImageView.image = UIImage(named: "1-4")
            case 41...50: mainImageView.image = UIImage(named: "1-5")
            case 51...60: mainImageView.image = UIImage(named: "1-6")
            case 61...70: mainImageView.image = UIImage(named: "1-7")
            case 71...80: mainImageView.image = UIImage(named: "1-8")
            default: mainImageView.image = UIImage(named: "1-9")
            }
        }
        
        //하단 하루 물 권장 섭취량 Label
        func onedayWaterLabel() {
            let name : String = UserDefaults.standard.string(forKey: "name") ?? "안녕하세요"
            var totalDrink = UserDefaults.standard.integer(forKey: "totalDrinkWater")
            if totalDrink == 0 {
                totalDrink = 2100
            }
            let totalDrinkLiter : Double =  Double(totalDrink) / 1000
            
            infoLabel.text = "\(name)님의 하루 물 권장 섭취량은 \(totalDrinkLiter)L입니다."
         }
    
    //** 리셋. 값을 0으로 다시잡으면 실행함수들은 0으로 진행하는 것 같은데
    //** 여기가 어떻게 해야할 지 몰랐던 부분 **
    @IBAction func resetButtonClicked(_ sender: UIBarButtonItem) {
        UserDefaults.standard.set(0, forKey: "totalDrinkWater")
        
        goalPercentLabel()
        growMainImageView()
        onedayWaterLabel()
        todayTotalmlLabel()
        
     }
    
    
    @IBAction func drinkButtonClicked(_ sender: UIButton) {
        let nowDrink : Int = Int(waterTextField.text!) ?? 0
        let todayDrink = UserDefaults.standard.integer(forKey: "totalDrinkWater")
        
        //여기서 동일키로 새로 저장해도 되는지 다시 찾아봐야할 듯함
        UserDefaults.standard.set(todayDrink + nowDrink, forKey:"totalDrinkWater")
        waterTextField.text = ""
        goalPercentLabel()
        growMainImageView()
        onedayWaterLabel()
        todayTotalmlLabel()
        
    }
    
    
    @IBAction func tapClicked(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    
}
