//
//  NavViewController.swift
//  mg2252_p3
//
//  Created by Medhavi Gandhi on 10/21/18.
//  Copyright © 2018 Medhavi Gandhi. All rights reserved.
//

import UIKit

class NavViewController: UIViewController {
    var titleField: UITextField!
    weak var delegate: ChangeButtonTitleDelegate?
    var buttonText: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        titleField = UITextField()
        titleField.translatesAutoresizingMaskIntoConstraints = false
        titleField.text = buttonText
        titleField.backgroundColor = .white
        titleField.borderStyle = .bezel


        view.addSubview(titleField)
        
        
        let add = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(addTapped))
        navigationItem.rightBarButtonItem = add
  

        setupConstraints()

        // Do any additional setup after loading the view.
        

        
        
        // Do any additional setup after loading the view.
    }
    
    @objc func setupConstraints() {
        NSLayoutConstraint.activate ([
            titleField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            titleField.heightAnchor.constraint(equalToConstant: 24)
            ])
       

        
        
        }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let redView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        redView.center = touches.first!.location(in: view)
        view.backgroundColor = .white
        redView.backgroundColor = .red
        view.addSubview(redView)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
//    @objc func popAndSaveText() {
//        if let text = titleField.text, text != "" {
//            delegate?.redSelected(newTitle: text)
//        }
//
//        self.navigationController?.popViewController(animated: true)
//    }
    @objc func addTapped() {
        if let text = titleField.text {
            delegate?.redSelected(newTitle: text)
        }
        if titleField.text! == "" {
            let alertController = UIAlertController(title: "Alert", message: "Title must have a valid value.", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Go Back", style: .cancel, handler: nil))
            self.present(alertController, animated: true, completion: nil)


        }
        
        self.navigationController?.popViewController(animated: true)
        
    }

}
