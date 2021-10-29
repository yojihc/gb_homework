//
//  LoginFormController.swift
//  l01
//
//  Created by yoji on 28.10.2021.
//

import UIKit

class LoginFormController: UIViewController {

//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }

   
    @IBAction func loginButtomPressed(_ sender: Any) {
        let login = loginInput.text!
        let password = passwordInput.text!
        if login == "admin" && password == "12345" {
            print("Логин и пароль верны")
        } else {
            print("Введеный логин и пароль не соответствуют")
        }
        }
    
    @IBOutlet weak var loginInput: UITextField!
    
    @IBOutlet weak var passwordInput: UITextField!
    
    @IBOutlet weak var ScrollView: UIScrollView!

    
@objc func keyboardWasShown(notification: Notification) {
    let info = notification.userInfo! as NSDictionary
    let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey)
                  as! NSValue) .cgRectValue.size
    let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
    
    self.ScrollView?.contentInset = contentInsets
    ScrollView?.scrollIndicatorInsets = contentInsets
    
}

@objc func keyboardWillBeHidden(notification: Notification) {
    let contentInsets = UIEdgeInsets.zero
    ScrollView?.contentInset = contentInsets
}

override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification: )), name: UIResponder.keyboardWillHideNotification, object: nil)
}
override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
    NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)


}
    @objc func hideKeyboard() {
        self.ScrollView?.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        ScrollView?.addGestureRecognizer(hideKeyboardGesture)
    }
}
