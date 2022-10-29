//
//  CreateAccountViewController.swift
//  a209EmailAuth
//
//  Created by 申潤五 on 2022/10/29.
//

import UIKit
import Firebase

class CreateAccountViewController: UIViewController {

    @IBOutlet weak var accout: UITextField!
    
    
    @IBOutlet weak var pw1: UITextField!
    
    
    @IBOutlet weak var pw2: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    

    @IBAction func createAccount(_ sender: Any) {
        
        let inputAccount = accout.text ?? ""
        let password1 = pw1.text ?? ""
        let passwrod2 = pw2.text ?? ""
        
        if password1.count < 6 {
            showMSG("密碼必需大於六個字元")
            return
        }
        
        
        if (password1 != passwrod2) {
            showMSG("兩次密碼必需相同")
            return
        }
        
        Auth.auth().createUser(withEmail: inputAccount, password: password1) { authResult, error in
            if let error = error{
                print(error.localizedDescription)
                self.showMSG("錯誤：\(error.localizedDescription ?? "不明")")
                             
                return
            }
            if let uid = authResult?.user.uid{
                let alert = UIAlertController(title: "提示", message: uid, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "我知道了", style: .default){_ in
                    self.dismiss(animated: true)
                })
                self.present(alert, animated: true)
                
            }
            
            
        }
        
        
        
    }
    
}

