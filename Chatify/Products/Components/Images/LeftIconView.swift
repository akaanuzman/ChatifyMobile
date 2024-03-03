//
//  LeftIconView.swift
//  Chatify
//
//  Created by Kaan Uzman on 3/3/24.
//

import Foundation
import UIKit

final class LeftIconView: UIView {
    var imageView: UIImageView

    init(image: UIImage) {
        imageView = UIImageView(image: image)
        super.init(frame: .zero)
        style()
        layout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LeftIconView {
    private func style() {
        translatesAutoresizingMaskIntoConstraints = false

        imageView.tintColor = .secondaryLabel
        imageView.translatesAutoresizingMaskIntoConstraints = false
    }

    private func layout() {
        addSubview(imageView)

        snp.makeConstraints { make in
            make.width.equalTo(30)
        }
    }
}
