//
//  TaskListVCExtension.swift
//  TCP Salman Test Task
//
//  Created by Salman Sharif on 08/06/2024.
//

import UIKit
extension TaskListVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.getTasks(for: viewModel.getdate()).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TasksTableViewCell", for: indexPath) as! TasksTableViewCell
        let model = viewModel.getTasks(for:viewModel.getdate())[indexPath.row]
        cell.configCell(model: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = TaskDetailVC.instantiate(fromAppStoryboard: .TaskDetail)
        let model = viewModel.getTasks(for:viewModel.getdate())[indexPath.row]
        vc.viewModel = TaskDetailViewModel(taskDetail: model, delegate: vc)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
