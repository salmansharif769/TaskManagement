//
//  TasksTableViewCell.swift
//  TCP Salman Test Task
//
//  Created by Salman Sharif on 08/06/2024.
//

import UIKit

class TasksTableViewCell: UITableViewCell {
    @IBOutlet weak private var titleLbl: TitleLabel!
    @IBOutlet weak private var dueDateLbl: DescLabel!
    @IBOutlet weak private var dueDateDescLbl: TitleLabel!
    @IBOutlet weak private var daysLeftLbl: DescLabel!
    @IBOutlet weak private var daysLeftDescLbl: TitleLabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    func configCell(model: Task){
        titleLbl.text = model.title
        dueDateDescLbl.text = model.dueDate?.toAppDateFormate() ?? ""
        daysLeftDescLbl.text = model.dueDate?.leftDays() ?? ""
    }
}
