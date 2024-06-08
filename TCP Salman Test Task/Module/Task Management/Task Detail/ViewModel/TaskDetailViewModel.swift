//
//  TaskDetailViewModel.swift
//  TCP Salman Test Task
//
//  Created by Salman Sharif on 08/06/2024.
//

import Foundation
protocol TaskDetailViewModelProtocol: AnyObject {
    func Reload()
}
class TaskDetailViewModel{
    private weak var delegate: TaskDetailViewModelProtocol!
    private var taskDetail: Task?
    init(taskDetail: Task, delegate: TaskDetailViewModelProtocol) {
        self.delegate = delegate
        self.taskDetail = taskDetail
    }
    
    func getDetail()->Task?{
        return taskDetail
    }
    func changeStatus(status: TaskStatus){
        taskDetail?.status = status
        delegate.Reload()
        NotificationCenter.default.post(name: .updateDetailNotification, object: taskDetail, userInfo: nil)
    }
}
