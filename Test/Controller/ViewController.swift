//
//  ViewController.swift
//  Test
//
//  Created by koki on 2021/06/04.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }

    @IBAction func login(_ sender: Any) {
        performSegue(withIdentifier: "topVC", sender: nil)
    }
    
}

