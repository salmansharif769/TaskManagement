//
//  CustomLabels.swift
//  TCP Salman Test Task
//
//  Created by Salman Sharif on 08/06/2024.
//

import UIKit
// MARK: - navigation label
class Label_Navigation: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    private func setupView() -> Void {
        self.textColor = AppColor.AppWhite
        self.font = AppFont.NavTitle
    }
}

class TitleLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    private func setupView() -> Void {
        self.textColor = AppColor.AppRed
        self.font = AppFont.TitleLabel
    }
}
class DetailTitleLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    private func setupView() -> Void {
        self.textColor = AppColor.AppRed
        self.font = AppFont.DetailTitleLabel
    }
}
class DescLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    private func setupView() -> Void {
        self.textColor = AppColor.AppTextBlack
        self.font = AppFont.DescLabel
    }
}
class NoTaskLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    private func setupView() -> Void {
        self.textColor = AppColor.AppWhite
        self.font = AppFont.NoTaskLabel
    }
}
