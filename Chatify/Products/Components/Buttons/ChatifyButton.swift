//
//  ChatifyButton.swift
//  Chatify
//
//  Created by Kaan Uzman on 3/3/24.
//

import UIKit

class ChatifyButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    // this is a storyboard required initializer
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    convenience init(color: UIColor, title: String, systemImage: UIImage) {
        self.init(frame: .zero)
        set(color: color, title: title, systemImage: systemImage)
    }
}

extension ChatifyButton {
    private func configure() {
        configuration = .tinted()
        configuration?.cornerStyle = .medium
        translatesAutoresizingMaskIntoConstraints = false
    }

    func set(color: UIColor, title: String, systemImage: UIImage) {
        configuration?.baseBackgroundColor = color
        configuration?.baseForegroundColor = color
        configuration?.title = title

        configuration?.image = systemImage
        configuration?.imagePadding = 6
        configuration?.imagePlacement = .leading
    }
}
