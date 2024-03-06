//
//  LoginFieldsView.swift
//  Chatify
//
//  Created by Kaan Uzman on 29/2/24.
//

import Foundation

import UIKit

final class LoginFieldsView: UIView {
    private let fieldStackView: UIStackView = .init()
    private let emailTextField: UITextField = .init()
    private let passwordTextField: UITextField = .init()
    private let dividerView = UIView()
    private let passwordRightIconView = UIButton(type: .custom)

    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoginFieldsView {
    private func style() {
        backgroundColor = .secondarySystemBackground
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 8
        clipsToBounds = true

        fieldStackView.translatesAutoresizingMaskIntoConstraints = false
        fieldStackView.axis = .vertical
        fieldStackView.spacing = 10

        // Field Icons
        let emailLeftIconView = LeftIconView(image: SFSymbols.email!)
        let passwordLeftIconView = LeftIconView(image: SFSymbols.lock!)

        passwordRightIconView.setImage(SFSymbols.eyeSlash, for: .normal)
        passwordRightIconView.tintColor = .secondaryLabel
        passwordRightIconView.addTarget(self,
                                        action: #selector(didTapShowPassword),
                                        for: .touchUpInside)

        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.placeholder = Texts.Fields.emailPlaceholder.rawValue
        emailTextField.textContentType = .emailAddress
        emailTextField.leftView = emailLeftIconView
        emailTextField.leftViewMode = .always
        emailTextField.keyboardType = .emailAddress
        emailTextField.returnKeyType = .next
        emailTextField.delegate = self

        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.backgroundColor = .secondarySystemFill

        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.placeholder = Texts.Fields.passwordPlaceholder.rawValue
        passwordTextField.isSecureTextEntry = true
        passwordTextField.textContentType = .password
        passwordTextField.leftView = passwordLeftIconView
        passwordTextField.leftViewMode = .always
        passwordTextField.rightView = passwordRightIconView
        passwordTextField.rightViewMode = .always
        passwordTextField.returnKeyType = .done
        passwordTextField.delegate = self
    }

    private func layout() {
        fieldStackView.addArrangedSubview(emailTextField)
        fieldStackView.addArrangedSubview(dividerView)
        fieldStackView.addArrangedSubview(passwordTextField)
        addSubview(fieldStackView)

        // Constraints
        fieldStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(16)
        }

        dividerView.snp.makeConstraints { make in
            make.height.equalTo(1)
        }
    }
}

extension LoginFieldsView {
    @objc private func didTapShowPassword() {
        passwordTextField.isSecureTextEntry.toggle()
        passwordRightIconView.setImage(passwordTextField.isSecureTextEntry ? SFSymbols.eyeSlash : SFSymbols.eye, for: .normal)
    }
}

extension LoginFieldsView: UITextFieldDelegate {
    private var nextTextField: UITextField? {
        if emailTextField.isFirstResponder {
            return passwordTextField
        }
        return nil
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextField = nextTextField {
            nextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
}
