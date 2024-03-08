//
//  RegisterVC.swift
//  Chatify
//
//  Created by Kaan Uzman on 7/3/24.
//

import Lottie
import UIKit

class RegisterVC: UIViewController {
    private let animationView = LottieAnimationView(name: Lotties.register.rawValue)
    private let fieldsView = RegisterFieldsView()
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
extension RegisterVC {
    /// This method is used for styling the view and subviews
    private func style() {
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
    }

    /// This method is used for layouting the view and subviews
    private func layout() {
        view.addSubview(animationView)
        view.addSubview(fieldsView)
        view.addSubview(signUpButton)

        animationView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(60)
            make.width.equalToSuperview().multipliedBy(0.7)
            make.height.equalToSuperview().dividedBy(4)
        }

        fieldsView.snp.makeConstraints { make in
            make.top.equalTo(animationView.snp.bottom).offset(24)
            make.leading.equalTo(24)
            make.trailing.equalTo(-24)
        }

        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(fieldsView.snp.bottom).offset(24)
            make.leading.equalTo(24)
            make.trailing.equalTo(-24)
        }
    }
}

#Preview {
    RegisterVC()
}
