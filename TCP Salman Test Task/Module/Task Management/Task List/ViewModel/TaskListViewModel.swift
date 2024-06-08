//
//  TaskListViewModel.swift
//  TCP Salman Test Task
//
//  Created by Salman Sharif on 08/06/2024.
//

import Foundation
protocol TaskListViewModelProtocol: AnyObject {
    func listReload()
    func NavTitleDate(date: String)
}
class TaskListViewModel {
    //MARK: -  veriables
    private weak var delegate: TaskListViewModelProtocol!
    private var tasksByDate: [String: [Task]] = [:]
    private var taskList: [Task] = []{
        didSet{
            filteredList()
        }
    }
    private var calendar = Calendar.current
    private var days = 0
    private var dateForList: Date {
        Calendar.current.date(byAdding: .day, value: days, to: Date())!
    }
    
    //MARK: - View model initialized
    init(delegate: TaskListViewModelProtocol) {
        self.delegate = delegate
        calendar.timeZone = TimeZone.current
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateTaskDetail), name: .updateDetailNotification, object: nil)
    }
    
    //MARK: - Private methods
    @objc func updateTaskDetail(_ notification: Notification){
        if let object = notification.object as? Task{
            for i in 0..<(tasksByDate[object.dueDate ?? ""]?.count ?? 0){
                if tasksByDate[object.dueDate ?? ""]?[i].id == object.id{
                    tasksByDate[object.dueDate ?? ""]?[i] = object
                }
            }
        }
    }
    private func filteredList(){
        for task in taskList {
            if let dueDate = task.dueDate {
                tasksByDate[dueDate, default: []].append(task)
            }
        }
    }
    
    private func sortTasks(tasks: [Task]) -> [Task] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormateStyle.appFormate.value
        let sortedByPriority = tasks.sorted { (task1, task2) -> Bool in
            return task1.priority ?? 0 < task2.priority ?? 0
        }
        return sortedByPriority.sorted { (task1, task2) in
            if let targetDate1 = task1.dueDate, let date1 = dateFormatter.date(from: targetDate1),
               let targetDate2 = task2.dueDate, let date2 = dateFormatter.date(from: targetDate2) {
                return date1 < date2
            }
            // If one of the dates is missing or invalid, consider the task with a valid date as "older"
            return task1.dueDate != nil
        }
    }
    
    //MARK: - Public methods
    func getdate() -> String{
        dateForList.string(with: .appFormate)
    }
    
    func dateChnage(day: Int){
        self.days = self.days + day
        self.delegate.listReload()
        delegate.NavTitleDate(date: dateForList == Date() ? "Today" : getdate())
    }
    
    func getTasks(for date: String) -> [Task] {
        return sortTasks(tasks: tasksByDate[date] ?? [])
    }
    
    func getTaskList() {
        TaskListServices.getTastList { [weak self] list, error in
            guard let self = self else { return }
            if error == nil {
                if let list = list?.response{
                    self.taskList = list
                    self.delegate.listReload()
                }
            }
        }
    }
}
