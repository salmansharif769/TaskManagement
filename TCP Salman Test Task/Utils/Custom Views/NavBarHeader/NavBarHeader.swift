//
//  NavBarHeader.swift
//  TCP Salman Test Task
//
//  Created by Salman Sharif on 08/06/2024.
//

import UIKit
class NavBarHeader: UIView {
    @IBOutlet weak var btnLeft: UIButton!
    @IBOutlet weak var titleLbl: Label_Navigation!
    @IBOutlet weak var btnRight: UIButton!
    var onLeftClick: (()->Void)?
    var onRightClick: (()->Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.titleLbl.minimumScaleFactor = 0.7
        self.titleLbl.adjustsFontSizeToFitWidth = true
    }
    
    func setTitle(_ title: String){
        titleLbl.text = title
    }
    
    @IBAction func leftBtnPressed(_ sender: UIButton) {
        onLeftClick?()
    }
    
    @IBAction func rightBtnPressed(_ sender: UIButton) {
        onRightClick?()
    }
    
}
