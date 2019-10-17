//
//  LoginViewController.swift
//  lab-keyboard-handling
//
//  Created by Levi Davis on 10/17/19.
//  Copyright © 2019 Levi Davis. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isScrollEnabled = false
        scrollView.backgroundColor = .cyan
        return scrollView
    }()
    
    lazy var userTextField: UITextField = {
        let userTF = UITextField()
        userTF.borderStyle = UITextField.BorderStyle.bezel
        userTF.placeholder = "Enter username"
        userTF.clearsOnInsertion = true
        userTF.textColor = .black
        userTF.backgroundColor = .white
        return userTF
    }()

    lazy var passwordTextField: UITextField = {
        let passwordTF = UITextField()
        passwordTF.borderStyle = UITextField.BorderStyle.bezel
        passwordTF.placeholder = "Enter password"
        passwordTF.clearsOnInsertion = true
        passwordTF.textColor = .black
        passwordTF.backgroundColor = .white
        return passwordTF
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setSubviewConstraints()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardSelectorTriggered(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil)

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setSubviewConstraints()
        self.scrollView.contentSize = CGSize(width: view.bounds.width, height: view.bounds.height + 500 )
    }
    
    @objc private func keyboardSelectorTriggered(sender: Notification) {
        print(sender.userInfo)
        moveViewsToAccomadateKeyboard(with: CGRect(x: 0, y: 0, width: 414, height: 346), and: 0.25)
    }
    
    private func moveViewsToAccomadateKeyboard(with keyboardRect: CGRect, and duration: Double) {
        guard keyboardRect != CGRect.zero else {
            scrollView.contentInset = UIEdgeInsets.zero
            scrollView.scrollIndicatorInsets = UIEdgeInsets.zero
            return
        }
        
        let hiddenAreaRect = keyboardRect.intersection(scrollView.bounds)
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: hiddenAreaRect.height, right: 0.0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets

//        var utf = userTextField.frame
//        utf = scrollView.convert(utf, from: userTextField.superview)
//        utf = utf.insetBy(dx: 0.0, dy: -20)
//        scrollView.scrollRectToVisible(utf, animated: true)
        
        var ptf = passwordTextField.frame
        ptf = scrollView.convert(ptf, from: passwordTextField.superview)
        ptf = ptf.insetBy(dx: 0.0, dy: -20)
        scrollView.scrollRectToVisible(ptf, animated: true)
    }
    
    
    private func setupSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(userTextField)
        scrollView.addSubview(passwordTextField)

    }
    
    private func setSubviewConstraints() {
        setScrollViewConstraints()
        setUserTextFieldConstraints()
        setPasswordTextFieldConstraints()
    }
    
    private func setScrollViewConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        [scrollView.topAnchor.constraint(equalTo: view.topAnchor),
         scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
         scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
         scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)].forEach {$0.isActive = true}
    }
    
    private func setUserTextFieldConstraints() {
        userTextField.translatesAutoresizingMaskIntoConstraints = false
        [userTextField.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
         userTextField.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
         userTextField.heightAnchor.constraint(equalToConstant: 50),
         userTextField.widthAnchor.constraint(equalToConstant: 300)].forEach {$0.isActive = true}
    }
    
    private func setPasswordTextFieldConstraints() {
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        [passwordTextField.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
         passwordTextField.topAnchor.constraint(equalTo: userTextField.bottomAnchor, constant: 20),
         passwordTextField.heightAnchor.constraint(equalToConstant: 50),
         passwordTextField.widthAnchor.constraint(equalToConstant: 300)].forEach {$0.isActive = true}
    }
    
}
