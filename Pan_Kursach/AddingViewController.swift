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
        let newUser = [
            "Login": txtLogin.text!,
            "Password": txtPassword.text!,
            "RoleID": 5,
            "UserName": txtName.text ?? "UserName",
            "UserEmail": txtEmail.text!,
            "UserDateOfBirth": txtDate.date,
            "StatusID": 5
        ] as [String : Any]
        
        AF.request(url, method: .post, parameters: newUser, encoder: JSONParameterEncoder).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
            case .failure(let error):
                print(error)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        txtDate.backgroundColor = .white
    }
    


}
