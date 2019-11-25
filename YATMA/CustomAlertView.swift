//
//  CustomAlertView.swift
//  YATMA
//
//  Created by MAC on 25/11/2019.
//  Copyright © 2019 Gera Volobuev. All rights reserved.
//

import UIKit

class CustomAlertView: UIViewController {

    @IBOutlet weak var userInput: UITextField!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var okButton: UIButton!

    var delegate: CustomAlertViewDelegate?
    let alertViewGrayColor = UIColor(red: 224.0/255.0, green: 224.0/255.0, blue: 224.0/255.0, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userInput.becomeFirstResponder()
        userInput.textColor = .white
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupView()
        animateView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.layoutIfNeeded()
    }
    
    func setupView() {
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
    }
    
    func animateView() {
        view.alpha = 0;
        self.view.frame.origin.y = self.view.frame.origin.y + 50
        UIView.animate(withDuration: 0.4, animations: { () -> Void in
            self.view.alpha = 1.0;
            self.view.frame.origin.y = self.view.frame.origin.y - 50
        })
    }
    
    @IBAction func onTapOk(_ sender: Any) {
        userInput.resignFirstResponder()
        delegate?.okButtonTapped(textFieldValue: userInput.text!)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onTapCancel(_ sender: Any) {
        userInput.resignFirstResponder()
        delegate?.cancelButtonTapped()
        self.dismiss(animated: true, completion: nil)
    }
    
}
