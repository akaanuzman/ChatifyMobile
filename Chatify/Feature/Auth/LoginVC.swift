//
//  LoginVC.swift
//  Chatify
//
//  Created by Kaan Uzman on 29/2/24.
//

import Foundation
import UIKit

class LoginVC: UIViewController {
    let stackView = UIStackView()
    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("loginvc did load!")
        style()
        layout()
    }
}

/// Style and layout methods are in this extension here
/// You can seperate your code with extensions like this
extension LoginVC {
    /// This method is used for styling the view and subviews
    private func style() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hello world!"
        label.font = .preferredFont(forTextStyle: .title1)
    }
    
    /// This method is used for layouting the view and subviews
    private func layout() {
        stackView.addArrangedSubview(label)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

#Preview {
    LoginVC()
}
