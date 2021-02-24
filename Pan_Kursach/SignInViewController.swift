//
//  ViewController.swift
//  Pan_Kursach
//
//  Created by WSR on 16.02.2021.
//

import UIKit
import Alamofire
import SwiftyJSON

class SignInViewController: UIViewController {

    @IBOutlet weak var inputLogin: UITextField!
    @IBOutlet weak var inputPassword: UITextField!
    
    @IBAction func signInAction(_ sender: UIButton) {
        
        let url = "http://172.16.1.71:7004/api/Users"
        
        AF.request(url, method: .get).validate().responseJSON { [self] response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                for index in 0..<json.count {
                    if inputLogin.text == json[index]["Login"].stringValue && inputPassword.text == json[index]["Password"].stringValue {
                        performSegue(withIdentifier: "goDirector", sender: nil)
                    } else {
//                        showAlert(message: "User not found")
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }


    func showAlert(message: String) {
        let alert = UIAlertController(title: "Notify", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
}

