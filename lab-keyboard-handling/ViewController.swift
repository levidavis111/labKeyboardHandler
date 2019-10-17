//
//  ViewController.swift
//  lab-keyboard-handling
//
//  Created by Levi Davis on 10/17/19.
//  Copyright © 2019 Levi Davis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var tappedScreenRecognizer: UITapGestureRecognizer = {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureTapped))
        
        return tapGesture
    }()
    
//    lazy var tappedScreenRecognizer: UILongPressGestureRecognizer = {
//        let tapGesture = UILongPressGestureRecognizer(target: self, action: #selector(tapGestureTapped))
//
//        return tapGesture
//    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "kumbaya")
        imageView.addGestureRecognizer(self.tappedScreenRecognizer)
        imageView.isUserInteractionEnabled = true
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        addSubviews()
        constrainSubviews()
//        self.view.isUserInteractionEnabled = true
        self.view.addGestureRecognizer(tappedScreenRecognizer)

        // Do any additional setup after loading the view.
    }
    
    @objc private func tapGestureTapped() {
//        print("Tap")
//
        let loginVC = LoginViewController()
        self.navigationController?.pushViewController(loginVC, animated: true)
        
//        guard let loginVC = FavoritesViewController()
//        favoriteVC.cityName = self.cityName
//        self.navigationController?.pushViewController(favoriteVC, animated: true)
    }
    
    private func addSubviews() {
        view.addSubview(imageView)
    }
    
    private func constrainSubviews() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        [imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
         imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant:  -100),
         imageView.heightAnchor.constraint(equalToConstant: 200),
         imageView.widthAnchor.constraint(equalToConstant: 200)].forEach {$0.isActive = true}
    }


}

