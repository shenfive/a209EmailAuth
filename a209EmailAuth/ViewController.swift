//
//  ViewController.swift
//  a209EmailAuth
//
//  Created by 申潤五 on 2022/10/29.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func goCreateAccount(_ sender: Any) {
        let nextVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "createAccount") as! CreateAccountViewController
        self.present(nextVC, animated: true)
    }
    
}

