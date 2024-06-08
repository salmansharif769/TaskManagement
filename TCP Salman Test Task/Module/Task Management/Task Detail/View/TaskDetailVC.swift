//
//  TaskDetailVC.swift
//  TCP Salman Test Task
//
//  Created by Salman Sharif on 08/06/2024.
//
import UIKit
class TaskDetailVC: BaseVC {
    //MARK: - outlets and veriables
    @IBOutlet weak private var navigationBar: UIView!
    @IBOutlet weak private var titleLbl: DetailTitleLabel!
    @IBOutlet weak private var dueDateLbl: DescLabel!
    @IBOutlet weak private var dueDateDescLbl: TitleLabel!
    @IBOutlet weak private var daysLeftLbl: DescLabel!
    @IBOutlet weak private var detailDescLbl: DescLabel!
    @IBOutlet weak private var daysLeftDescLbl: TitleLabel!
    @IBOutlet weak private var statusLbl: TitleLabel!
    @IBOutlet weak private var resolveBtn: UIButton!
    @IBOutlet weak private var cantResolveBtn: UIButton!
    @IBOutlet weak private var buttonsView: UIView!
    @IBOutlet weak private var statusImage: UIImageView!
    var viewModel: TaskDetailViewModel!
    
    //MARK: - View Delegate methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupDetail()
    }
    //MARK: - PRivate methods
    private func setupView(){
        setUpNavigation(for: navigationBar, ScreenTitles.TaskDetail, hideRightBtn: true, onLeftClick: {
            self.navigationController?.popViewController(animated: true)
        })
    }
    private func setupDetail(){
        guard let detail = viewModel.getDetail() else { return }
        titleLbl.text = detail.title
        dueDateDescLbl.text = detail.dueDate?.toAppDateFormate() ?? ""
        daysLeftDescLbl.text = detail.dueDate?.leftDays() ?? ""
        detailDescLbl.text = detail.description ?? ""
        resolveBtn.titleLabel?.font = AppFont.TitleLabel
        cantResolveBtn.titleLabel?.font = AppFont.TitleLabel
        var textColor = AppColor.AppRed
        switch detail.status{
        case .Resolved:
            textColor = .appGreen
            statusLbl.text = detail.status.rawValue
            textColorApply()
            buttonsView.isHidden = true
            statusImage.isHidden = false
            statusImage.image = UIImage(named: "sign_resolved")
        case .UnResolved:
            textColor = .appRed
            statusLbl.text = detail.status.rawValue
            textColorApply()
            buttonsView.isHidden = true
            statusImage.isHidden = false
            statusImage.image = UIImage(named: "unresolved_sign")
        case .UnResolvedDefault:
            textColor = .appRed
            statusLbl.text = "UnResolved"
            textColorApply()
            statusLbl.textColor = .orange
            buttonsView.isHidden = false
            statusImage.isHidden = true
        }
        
        func textColorApply(){
            titleLbl.textColor = textColor
            dueDateDescLbl.textColor = textColor
            daysLeftDescLbl.textColor = textColor
            statusLbl.textColor = textColor
        }
    }
    //MARK: - Button action
    @IBAction func resolveBtnAction(_ sender: UIButton){
        viewModel.changeStatus(status: .Resolved)
    }
    @IBAction func cantResolveBtnAction(_ sender: UIButton){
        viewModel.changeStatus(status: .UnResolved)
    }
}
//MARK: - view model delegate methods
extension TaskDetailVC: TaskDetailViewModelProtocol{
    func Reload() {
        setupDetail()
    }
}
