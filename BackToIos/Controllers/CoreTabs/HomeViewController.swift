//
//  ViewController.swift
//  BackToIos
//
//  Created by Ömer Faruk KÖSE on 11.06.2023.
//

import FirebaseAuth
import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        CheckAuthenticationStatus()
    }

    private func CheckAuthenticationStatus(){
        
        // check current user
        if Auth.auth().currentUser == nil {
            // navigate to login screen
            let loginVC = LoginViewController()
            loginVC.modalPresentationStyle = .fullScreen
            
            present(loginVC, animated: false)
        }
    }

}

