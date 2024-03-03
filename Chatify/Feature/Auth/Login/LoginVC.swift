//
//  LoginVC.swift
//  Chatify
//
//  Created by Kaan Uzman on 29/2/24.
//

import Foundation
import Lottie
import SnapKit
import UIKit

class LoginVC: UIViewController {
    private let animationView = LottieAnimationView(name: Lotties.login.rawValue)
    private let titleLabel: UILabel = .init()
    private let fieldsView = LoginFieldsView()
    private let signInButton = ChatifyButton(color: .systemBlue,
                                             title: Texts.Buttons.signIn.rawValue,
                                             systemImage: SFSymbols.login!)
    private let signUpButton = ChatifyButton(color: .systemPurple,
                                             title: Texts.Buttons.signUp.rawValue,
                                             systemImage: SFSymbols.register!)

    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

/// Style and layout methods are in this extension here
/// You can seperate your code with extensions like this
extension LoginVC {
    /// This method is used for styling the view and subviews
    private func style() {
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = Texts.Login.title.rawValue
        titleLabel.font = .preferredFont(forTextStyle: .extraLargeTitle2)
    }

    /// This method is used for layouting the view and subviews
    private func layout() {
        view.addSubview(animationView)
        view.addSubview(titleLabel)
        view.addSubview(fieldsView)
        view.addSubview(signInButton)
        view.addSubview(signUpButton)

        animationView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(0.2)
            make.width.equalToSuperview().multipliedBy(0.7)
            make.height.equalToSuperview().multipliedBy(0.4)
        }

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(animationView.snp.bottom)
            make.leading.equalTo(24)
        }

        fieldsView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(24)
            make.leading.equalTo(24)
            make.trailing.equalTo(-24)
        }

        signInButton.snp.makeConstraints { make in
            make.top.equalTo(fieldsView.snp.bottom).offset(24)
            make.leading.equalTo(24)
            make.trailing.equalTo(-24)
        }

        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(signInButton.snp.bottom).offset(24)
            make.leading.equalTo(24)
            make.trailing.equalTo(-24)
        }
    }
}

#Preview {
    LoginVC()
}
