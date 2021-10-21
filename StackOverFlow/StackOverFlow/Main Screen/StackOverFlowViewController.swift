//
//  StackOverFlowViewController.swift
//  StackOverFlow
//
//  Created by Preshen Naidoo on 2021/10/20.
//

import UIKit
import SOFComponentsKit
import SOFNetworkKit

class StackOverFlowViewController: UIViewController {
    
    @IBOutlet private var tableView: UITableView!
    @IBOutlet private var searchBarView: SearchBarView!
    @IBOutlet private var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet private var loadingIndicatorView: UIView!
    @IBOutlet private var centreViewHeading: UILabel!
    
    private lazy var viewModel = StackOverFlowViewModel(interactor: BaseNetworkLayer(),
                                                        delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == "DetailsSegue" {
            let destinationViewController = segue.destination as? StackOverFlowDetailsViewController
            destinationViewController?.setModel(stackOverFlowQuestionDetails: viewModel.selectedQuestion!)
        }
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        searchBarView.delegate = self
        tableView.separatorStyle = .none
    }
}

extension StackOverFlowViewController: BaseViewModelDelegate {
    func refreshViewContents() {
        DispatchQueue.main.async {
            self.loadingIndicator.stopAnimating()
            self.loadingIndicatorView.isHidden = true
            self.tableView.reloadData()
            if self.viewModel.hasNoContent {
                self.centreViewHeading.isHidden = false
                self.loadingIndicatorView.isHidden = false
            }
        }
    }
    
    func showErrorMessage(errorMessage: String) {
        //TODO
    }
}

extension StackOverFlowViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "ListCellView", for: indexPath) as? ListCellView
        cell?.populate(with: viewModel.questionCard(at: indexPath.row))
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.currentSelectedQuestion(at: indexPath.row)
        self.performSegue(withIdentifier: "DetailsSegue", sender: self)
    }
}

extension StackOverFlowViewController: SearchBarViewDelegate {
    
    func clearSearchBar() {
        searchBarView.clearSearchBar()
        loadingIndicator.startAnimating()
        self.loadingIndicatorView.isHidden = false
        self.centreViewHeading.isHidden = true
        viewModel.searchStackOverFlow(with: "")
    }
    
    func tappedSearchBar(with keyword: String) {
        loadingIndicator.startAnimating()
        self.loadingIndicatorView.isHidden = false
        self.centreViewHeading.isHidden = true
        viewModel.searchStackOverFlow(with: keyword)
    }
}
