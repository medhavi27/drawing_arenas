//
//  ViewController.swift
//  mg2252_p3
//
//  Created by Medhavi Gandhi on 10/20/18.
//  Copyright © 2018 Medhavi Gandhi. All rights reserved.
//

import UIKit


protocol ChangeButtonTitleDelegate: class {
    func redSelected(newTitle: String)
    func blueSelected(newTitle: String)
   
}

class ViewController: UIViewController {
    var redSquareArena: UIButton!
    var blueCircArena: UIButton!
    weak var delegate: ChangeButtonTitleDelegate?



    override func viewDidLoad() {
        title = "Drawing Arena"
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view, typically from a nib.
//        present(ModalViewController(), animated: true, completion: nil)
        redSquareArena = UIButton()
        redSquareArena.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(redSquareArena
        )
        redSquareArena.setTitle("Red Square Arena", for: .normal)
        redSquareArena.setTitleColor(.red, for: .normal)
        redSquareArena.addTarget(self, action: #selector(pushNavViewController), for: .touchUpInside)
        
        blueCircArena = UIButton()
        blueCircArena.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(blueCircArena)
        blueCircArena.setTitle("Blue Circle Arena", for: .normal)
        blueCircArena.addTarget(self, action: #selector(presentModalViewController), for: .touchUpInside)
        blueCircArena.setTitleColor(.blue, for: .normal)
        
        setupConstraints()

    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            redSquareArena.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            redSquareArena.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            redSquareArena.heightAnchor.constraint(equalToConstant: 24)
            ])
        NSLayoutConstraint.activate([
            blueCircArena.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            blueCircArena.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 40)
        ])
        
    }
    
    @objc func presentModalViewController() {
        let modalViewController = ModalViewController()
        modalViewController.delegate = self
        modalViewController.bluetext = blueCircArena.titleLabel!.text!
        present(modalViewController, animated: true)
        
    }
    
    @objc func pushNavViewController() {
        let navViewController = NavViewController()
        navViewController.delegate = self
        navigationController?.pushViewController(navViewController, animated: true)
        navViewController.buttonText = redSquareArena.titleLabel!.text!
    }
    
  
    
}

extension ViewController: ChangeButtonTitleDelegate {
    func redSelected(newTitle: String) {
        redSquareArena.setTitle(newTitle, for: .normal)
    }
    func blueSelected(newTitle: String) {
        blueCircArena.setTitle(newTitle, for: .normal)

    }
    
   
        
    
    
    
}
