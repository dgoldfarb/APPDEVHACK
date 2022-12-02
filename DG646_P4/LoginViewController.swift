//
//  LoginViewController.swift
//  DG646_P4
//
//  Created by David Goldfarb on 12/1/22.
//

import UIKit

class LoginViewController: UIViewController {
    let nameApp = UILabel()
    let emailText = UITextField()
    let passwordText = UITextField()
    let loginButton = UIButton()
    let registerButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login or Register"
        view.backgroundColor = .systemYellow
        
        nameApp.text = "FIT FIND CORNELL"
        nameApp.translatesAutoresizingMaskIntoConstraints = false
        nameApp.textAlignment = .center
        nameApp.font = nameApp.font.withSize(20)
        view.addSubview(nameApp)
        
        emailText.placeholder = "Email"
        emailText.layer.borderWidth = 1
        emailText.layer.borderColor = UIColor.black.cgColor
        emailText.clipsToBounds = true
        emailText.layer.cornerRadius = 3
        emailText.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(emailText)
        
        passwordText.placeholder = "Password"
        passwordText.translatesAutoresizingMaskIntoConstraints = false
        passwordText.layer.borderWidth = 1
        passwordText.layer.borderColor = UIColor.black.cgColor
        passwordText.clipsToBounds = true
        passwordText.layer.cornerRadius = 3
        view.addSubview(passwordText)
        
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.black, for: .normal)
        loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        loginButton.backgroundColor = .systemYellow
        loginButton.clipsToBounds = false
        loginButton.layer.cornerRadius = 10
        loginButton.layer.borderWidth = 1
        loginButton.layer.borderColor = UIColor.black.cgColor
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginButton)
        
        registerButton.setTitle("Register", for: .normal)
        registerButton.setTitleColor(.black, for: .normal)
        registerButton.addTarget(self, action: #selector(register), for: .touchUpInside)
        registerButton.backgroundColor = .systemYellow
        registerButton.clipsToBounds = false
        registerButton.layer.cornerRadius = 10
        registerButton.layer.borderWidth = 1
        registerButton.layer.borderColor = UIColor.black.cgColor
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(registerButton)
        setupConstraints()
        

        // Do any additional setup after loading the view.
    }
    func setupConstraints(){
        
        NSLayoutConstraint.activate([
            nameApp.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 40),
            nameApp.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameApp.widthAnchor.constraint(equalToConstant: 200)
        
        ])
        NSLayoutConstraint.activate([
            emailText.topAnchor.constraint(equalTo: nameApp.bottomAnchor,constant: 40),
            emailText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailText.widthAnchor.constraint(equalToConstant: 200),
            emailText.heightAnchor.constraint(equalToConstant: 30)
        
        ])
        
        NSLayoutConstraint.activate([
            passwordText.topAnchor.constraint(equalTo: emailText.bottomAnchor,constant: 40),
            passwordText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordText.heightAnchor.constraint(equalToConstant: 30),
            passwordText.widthAnchor.constraint(equalToConstant: 200)

        ])
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: passwordText.bottomAnchor,constant: 40),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: 200)

        ])
        
        NSLayoutConstraint.activate([
            registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor,constant: 40),
            registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerButton.widthAnchor.constraint(equalToConstant: 200)

        ])
        
        
        
    }
    
    @objc func login(){
        navigationController?.pushViewController(ViewController(), animated: true)
        
    }
    @objc func register(){
        
        //navigationController?.pushViewController(ViewController(), animated: true)
        
    }
        
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
