//
//  ViewController.swift
//  a209EmailAuth
//
//  Created by 申潤五 on 2022/10/29.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Auth.auth().addStateDidChangeListener { auth, user in
            if let user = user{
//                self.statusLabel.text = "歡迎：" + (user.displayName ?? "未知")
                print(user.email)
//                self.signOutBtn.isEnabled = true
//                self.gSingInButton.isEnabled = false
            }else{
                print("未登入")
//                self.statusLabel.text = "未登入"
//                self.signOutBtn.isEnabled = false
//                self.gSingInButton.isEnabled = true
            }
        }
        
        
        
        
    }

    @IBAction func goCreateAccount(_ sender: Any) {
        let nextVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "createAccount") as! CreateAccountViewController
        self.present(nextVC, animated: true)
    }
    
    
    
    @IBAction func singOut(_ sender: Any) {
        do{
            try Auth.auth().signOut()
        }catch{
            print(error.localizedDescription)
        }
        
    }
}

