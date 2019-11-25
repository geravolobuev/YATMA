//
//  CustomAlertViewDelegate.swift
//  YATMA
//
//  Created by MAC on 25/11/2019.
//  Copyright © 2019 Gera Volobuev. All rights reserved.
//

protocol CustomAlertViewDelegate: class {
    func okButtonTapped(textFieldValue: String)
    func cancelButtonTapped()
}
