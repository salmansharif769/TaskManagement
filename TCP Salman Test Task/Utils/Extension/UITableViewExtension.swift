//
//  UITableViewExtension.swift
//  TCP Salman Test Task
//
//  Created by Salman Sharif on 08/06/2024.
//

import UIKit
extension UITableViewCell {
    static func register(_ tableView: UITableView) {
        let cellName = String(describing: self)
        tableView.register(UINib(nibName: cellName, bundle: nil), forCellReuseIdentifier: cellName)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 30
        tableView.tableFooterView = UIView()
    }
}
