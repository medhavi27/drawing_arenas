//
//  ModalViewController.swift
//  mg2252_p3
//
//  Created by Medhavi Gandhi on 10/20/18.
//  Copyright © 2018 Medhavi Gandhi. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {
    var titleField: UITextField!
    var save: UIButton!
    weak var delegate: ChangeButtonTitleDelegate?
    var bluetext: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        titleField = UITextField()
        titleField.translatesAutoresizingMaskIntoConstraints = false
        titleField.backgroundColor = .white
        titleField.borderStyle = .bezel
        titleField.text = bluetext
        
        view.addSubview(titleField)
        
        
        save = UIButton()
        save.translatesAutoresizingMaskIntoConstraints = false
        save.setTitle("Save", for: .normal)
        save.backgroundColor = .blue
        save.addTarget(self, action: #selector(dismissAndSaveText), for: .touchUpInside)
        view.addSubview(save)
        
        setupConstraints()
        

        // Do any additional setup after loading the view.
    }
    
    @objc func setupConstraints() {
        NSLayoutConstraint.activate ([
            titleField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 36),
            titleField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -36),
            titleField.heightAnchor.constraint(equalToConstant: 24)
            ])
        NSLayoutConstraint.activate ([
            save.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            save.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            save.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            save.heightAnchor.constraint(equalToConstant: 30)
            ])
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let blueView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        blueView.center = touches.first!.location(in: view)
        view.backgroundColor = .white
        blueView.layer.cornerRadius = 20
        blueView.backgroundColor = .blue
        view.addSubview(blueView)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


@objc func dismissAndSaveText() {
    if let text = titleField.text {
        
        delegate?.blueSelected(newTitle: text)
    }
    if titleField.text! == "" {
        let alertController = UIAlertController(title: "Alert", message: "Title must have a valid value.", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Go Back", style: .cancel, handler: nil))
        self.present(alertController, animated: true, completion: nil)
        
    }
    dismiss(animated: true, completion: nil)
}
}
