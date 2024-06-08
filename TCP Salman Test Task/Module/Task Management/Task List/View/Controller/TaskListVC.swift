//
//  TaskListVC.swift
//  TCP Salman Test Task
//
//  Created by Salman Sharif on 08/06/2024.
//
import UIKit
class TaskListVC: BaseVC {
    //MARK: - outlets and veriables
    @IBOutlet weak private var navigationBar: UIView!
    @IBOutlet weak private var taskListTableView: UITableView!
    @IBOutlet weak private var NoTaskView: UIView!
    var viewModel: TaskListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        registerNibs()
        DispatchQueue.main.asyncAfter(deadline: .now()+1.0) {
            self.LoadingStart()
            self.viewModel.getTaskList()
        }
    }
    
    private func setupView(){
        viewModel = TaskListViewModel(delegate: self)
        setUpNavigation(for: navigationBar, ScreenTitles.TastList) {
            self.viewModel.dateChnage(day: -1)
        } onRightClick: {
            self.viewModel.dateChnage(day: 1)
        }
    }
    
    private func registerNibs(){
        TasksTableViewCell.register(taskListTableView)
    }
}

extension TaskListVC: TaskListViewModelProtocol{
    func listReload(){
        self.LoadingStop()
        if viewModel.getTasks(for: viewModel.getdate()).count == 0{
            NoTaskView.isHidden = false
        } else{
            NoTaskView.isHidden = true
        }
        taskListTableView.reloadData()
    }
    
    func NavTitleDate(date: String){
        navigationView?.setTitle(date)
    }
}


