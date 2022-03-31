//
//  UIStackView.swift
//  MyCalendar
//
//  Created by Максим Боталов on 27.03.2022.
//

import UIKit

extension UIStackView {
    convenience init(arrangedSubviews: [UIView], distribution: UIStackView.Distribution, axis: NSLayoutConstraint.Axis, spacing: CGFloat) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.distribution = distribution
        self.axis = axis
        self.spacing = spacing
        self.translatesAutoresizingMaskIntoConstraints = false
        self.contentHuggingPriority(for: .horizontal)
        self.alignment = .leading
    }
}
