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
    
    @IBOutlet private var listview: ListView!
    
    private lazy var viewModel = StackOverFlowViewModel(interactor: BaseNetworkLayer(),
                                                        delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetch()
    }
}

extension StackOverFlowViewController: BaseViewModelDelegate {
    func refreshViewContents() {
        //TODO
    }
    
    func showErrorMessage(errorMessage: String) {
        //TODO
    }
}

extension StackOverFlowViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //TODO
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //TODO
        return UITableViewCell()
    }
}
