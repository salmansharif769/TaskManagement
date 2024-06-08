//
//  BaseVC.swift
//  TCP Salman Test Task
//
//  Created by Salman Sharif on 08/06/2024.
//
import UIKit
class BaseVC: UIViewController {
    var navigationView  : NavBarHeader?
    var isNavigated = false
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func setUpNavigation(for view : UIView, _ title: String, hideRightBtn: Bool = false, onLeftClick: (()->Void)? = nil, onRightClick: (()->Void)? = nil) {
        navigationView = UINib(nibName: "NavBarHeader", bundle: nil).instantiate(withOwner: self, options: nil)[0] as? NavBarHeader
        navigationView?.frame = view.bounds
        navigationView?.setTitle(title)
        navigationView?.btnRight.isHidden = hideRightBtn
        navigationView?.onLeftClick = { [weak self] in
            guard self != nil else { return }
            onLeftClick?()
        }
        navigationView?.onRightClick = { [weak self] in
            guard self != nil else { return }
            onRightClick?()
        }
        view.addSubview(navigationView ?? UIView())
    }
}
