//
//  StoreViewController.swift
//  Test
//
//  Created by koki on 2021/06/04.
//

import UIKit

class StoreViewController: UIViewController {

    let contentsView = UIView()
    let nameText = UILabel()
    let nameTextField = UITextField()
    let emailText = UILabel()
    let emailTextField = UITextField()
    let passwordText = UILabel()
    let passwordTextField = UITextField()
    let password_confirmationText = UILabel()
    let password_confirmationTextField = UITextField()
    let storeButton = UIButton()
    var userInfo = UserInfo()

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentsView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height * 2)
        scrollView.addSubview(contentsView)
        scrollView.contentSize = contentsView.frame.size
        
        nameText.text = "名前"
        nameText.frame = CGRect(x: 56, y: 180, width: 100, height: 21)
        nameText.textColor = .black
        contentsView.addSubview(nameText)
        
        nameTextField.frame = CGRect(x: 56, y: 210, width: 273, height: 34)
        nameTextField.borderStyle = .roundedRect
        contentsView.addSubview(nameTextField)
        
        emailText.text = "メールアドレス"
        emailText.frame = CGRect(x: 56, y: 270, width: 150, height: 21)
        emailText.textColor = .black
        contentsView.addSubview(emailText)
        
        emailTextField.frame = CGRect(x: 56, y: 300, width: 273, height: 34)
        emailTextField.borderStyle = .roundedRect
        contentsView.addSubview(emailTextField)
        
        passwordText.text = "パスワード"
        passwordText.frame = CGRect(x: 56, y: 360, width: 100, height: 21)
        passwordText.textColor = .black
        contentsView.addSubview(passwordText)
        
        passwordTextField.frame = CGRect(x: 56, y: 390, width: 273, height: 34)
        passwordTextField.borderStyle = .roundedRect
        contentsView.addSubview(passwordTextField)
        
        password_confirmationText.text = "パスワード確認"
        password_confirmationText.frame = CGRect(x: 56, y: 450, width: 100, height: 21)
        password_confirmationText.textColor = .black
        contentsView.addSubview(password_confirmationText)
        
        password_confirmationTextField.frame = CGRect(x: 56, y: 480, width: 273, height: 34)
        password_confirmationTextField.borderStyle = .roundedRect
        contentsView.addSubview(password_confirmationTextField)
        
        
        storeButton.frame = CGRect(x: 56, y: 540, width: 200, height: 100)
        storeButton.setTitle("登録", for: UIControl.State.normal)
        storeButton.backgroundColor = .blue
        storeButton.setTitleColor(UIColor.white, for: .normal)
        storeButton.addTarget(self, action: #selector(StoreButtonTapped), for: .touchUpInside)
        contentsView.addSubview(storeButton)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    @objc func StoreButtonTapped(){
        
        if !validateEmail(candidate: emailTextField.text!) {
            let errEmail = UILabel()
            errEmail.frame = CGRect(x: 70, y: 270, width: 200, height: 30)
            errEmail.text = "正しいメールアドレスを入力してください"
            errEmail.textColor = .red
            contentsView.addSubview(errEmail)
        }
        
        
        let urlString = "http://52.194.225.173/api/register"
        let encodeUrlString:String = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        userInfo.name = nameTextField.text!
        userInfo.email = emailTextField.text!
        userInfo.password = passwordTextField.text!
        userInfo.password_confirmation = password_confirmationTextField.text!
        
        userInfo.StoreData(encodeUrlString: encodeUrlString)
        
    }
    
    func validateEmail(candidate: String) -> Bool {
         let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
            return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: candidate)
        }
    
    

}
