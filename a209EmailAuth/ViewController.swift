//
//  ViewController.swift
//  a209EmailAuth
//
//  Created by 申潤五 on 2022/10/29.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var account: UITextField!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Auth.auth().addStateDidChangeListener { auth, user in
            if let user = user{
                self.statusLabel.text = "歡迎：" + (user.email ?? "未知")
                print(user.email)
            }else{
                print("未登入")
                self.statusLabel.text = "未登入"
            }
        }
        
        
        
        
    }

    @IBAction func goCreateAccount(_ sender: Any) {
        let nextVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "createAccount") as! CreateAccountViewController
        self.present(nextVC, animated: true)
    }
    
    @IBAction func singIn(_ sender: Any) {
        let theAccount = account.text ?? ""
        let thePassword = password.text ?? ""
        
        // 各種檢查
        
        Auth.auth().signIn(withEmail: theAccount, password: thePassword){ authResult, error in
            if let error = error{
                self.showMSG(error.localizedDescription)
                return
            }
            
        }
        
    }
    
    
    @IBAction func singOut(_ sender: Any) {
        do{
            try Auth.auth().signOut()
        }catch{
            print(error.localizedDescription)
        }
        
    }
}

