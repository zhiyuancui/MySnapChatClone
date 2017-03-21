//
//  LoginVC.swift
//  MySnapChat
//
//  Created by Zhiyuan Cui on 3/21/17.
//  Copyright © 2017 Zhiyuan Cui. All rights reserved.
//

import UIKit


class LoginVC: UIViewController {

    @IBOutlet weak var emailField: RoundTextField!
    @IBOutlet weak var passwordField: RoundTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func LoginTapped(_ sender: UIButton) {
        if let email = emailField.text ,
           let pass = passwordField.text, ( email.characters.count > 0 && pass.characters.count > 0 ){
            
            AuthService.instance.login( email: email, password: pass, onComplete: { (errMsg, data) in
                guard errMsg == nil else{
                    let alert = UIAlertController(title:"Error Authentication", message: errMsg, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title:"OK", style: .cancel, handler:nil))
                    self.present(alert, animated: true, completion: nil)
                    return
                }
                
                self.dismiss(animated: true, completion: nil)
            });
            
        }
        else{
            let alert = UIAlertController(title:"Username and Password Required",message:"You must enter both a username and a password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title:"OK", style:.cancel, handler:nil))
            present(alert, animated: true, completion: nil)
        }
        
    }
}
