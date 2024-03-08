//
//  RegisterFieldsView.swift
//  Chatify
//
//  Created by Kaan Uzman on 7/3/24.
//

import Foundation
import UIKit

final class RegisterFieldsView: UIView {
    private let fieldStackView: UIStackView = .init()
    private let emailTextField: UITextField = .init()
    private let passwordTextField: UITextField = .init()
    private let dividerView = UIView()
    private let secondDividerView = UIView()
    private let againPasswordTextField: UITextField = .init()
    private let passwordRightIconView = UIButton(type: .custom)
    private let againPasswordRightIconView = UIButton(type: .custom)

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

extension RegisterFieldsView {
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
        let againPasswordLeftIconView = LeftIconView(image: SFSymbols.lock!)

        passwordRightIconView.setImage(SFSymbols.eyeSlash, for: .normal)
        passwordRightIconView.tintColor = .secondaryLabel
        passwordRightIconView.addTarget(self,
                                        action: #selector(didTapShowPassword),
                                        for: .touchUpInside)

        againPasswordRightIconView.setImage(SFSymbols.eyeSlash, for: .normal)
        againPasswordRightIconView.tintColor = .secondaryLabel
        againPasswordRightIconView.addTarget(self,
                                             action: #selector(didTapShowAgainPassword),
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
        passwordTextField.textContentType = .newPassword
        passwordTextField.leftView = passwordLeftIconView
        passwordTextField.leftViewMode = .always
        passwordTextField.rightView = passwordRightIconView
        passwordTextField.rightViewMode = .always
        passwordTextField.returnKeyType = .next
        passwordTextField.delegate = self

        secondDividerView.translatesAutoresizingMaskIntoConstraints = false
        secondDividerView.backgroundColor = .secondarySystemFill

        againPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        againPasswordTextField.placeholder = Texts.Fields.confirmPasswordPlaceholder.rawValue
        againPasswordTextField.isSecureTextEntry = true
        againPasswordTextField.textContentType = .newPassword
        againPasswordTextField.leftView = againPasswordLeftIconView
        againPasswordTextField.leftViewMode = .always
        againPasswordTextField.rightView = againPasswordRightIconView
        againPasswordTextField.rightViewMode = .always
        againPasswordTextField.returnKeyType = .done
        againPasswordTextField.delegate = self
    }

    private func layout() {
        fieldStackView.addArrangedSubview(emailTextField)
        fieldStackView.addArrangedSubview(dividerView)
        fieldStackView.addArrangedSubview(passwordTextField)
        fieldStackView.addArrangedSubview(secondDividerView)
        fieldStackView.addArrangedSubview(againPasswordTextField)

        addSubview(fieldStackView)

        // Constraints
        fieldStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(16)
        }

        dividerView.snp.makeConstraints { make in
            make.height.equalTo(1)
        }

        secondDividerView.snp.makeConstraints { make in
            make.height.equalTo(1)
        }
    }
}

extension RegisterFieldsView {
    @objc private func didTapShowPassword() {
        passwordTextField.isSecureTextEntry.toggle()
        passwordRightIconView.setImage(passwordTextField.isSecureTextEntry ? SFSymbols.eyeSlash : SFSymbols.eye, for: .normal)
    }

    @objc private func didTapShowAgainPassword() {
        againPasswordTextField.isSecureTextEntry.toggle()
        againPasswordRightIconView.setImage(againPasswordTextField.isSecureTextEntry ? SFSymbols.eyeSlash : SFSymbols.eye, for: .normal)
    }
}

extension RegisterFieldsView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            againPasswordTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
}