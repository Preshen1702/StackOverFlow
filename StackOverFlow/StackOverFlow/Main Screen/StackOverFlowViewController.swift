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
