//
//  AddingViewController.swift
//  Pan_Kursach
//
//  Created by user on 24.02.2021.
//

import UIKit
import SwiftyJSON
import Alamofire

class AddingViewController: UIViewController {

    @IBOutlet weak var txtLogin: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtDate: UIDatePicker!
    let url = "http://172.16.1.71:7004/api/Users"
    
    @IBAction func btnAdd(_ sender: UIButton) {
        
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd 00:00:00"
        let res = df.string(from: txtDate.date)
        
        let newUser: Parameters = [
            "Login": txtLogin.text!,
            "Password": txtPassword.text!,
            "RoleID": 5,
            "UserName": txtName.text ?? "UserName",
            "UserEmail": txtEmail.text!,
            "UserDateOfBirth": res,
            "StatusID": 5
        ]

        AF.request(url, method: .post, parameters: newUser, encoding: JSONEncoding.default, headers: nil).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
            case .failure(let error):
                let alert = UIAlertController(title: "Alert", message: "Message",preferredStyle: .alert)
                alert.present(alert, animated: true)
                print(error)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        txtDate.backgroundColor = .white
    }
    


}
