//
//  StackOverFlowViewModel.swift
//  StackOverFlow
//
//  Created by Preshen Naidoo on 2021/10/20.
//

import Foundation
import SOFNetworkKit

protocol BaseViewModelDelegate: NSObjectProtocol {
    func refreshViewContents()
    func showErrorMessage(errorMessage: String)
}

class StackOverFlowViewModel {
    
    private var interactor: BaseNetworkLayer?
    private weak var delegate: BaseViewModelDelegate?
    
    var stackOverFlowQuestionsDetails: StackOverFlowQuestionsModel?
    
    init(interactor: BaseNetworkLayer,
         delegate: BaseViewModelDelegate) {
        self.interactor = interactor
        self.delegate = delegate
    }
    
    func fetch() {
        interactor?.fetchRestaurants(searchString: "swift") { [weak self] (responseData) in
            let decoder = JSONDecoder()
            self?.stackOverFlowQuestionsDetails = try! decoder.decode(StackOverFlowQuestionsModel.self, from: responseData)
            self?.delegate?.refreshViewContents()
        } failure: { [weak self] (error) in
            self?.delegate?.showErrorMessage(errorMessage: error?.localizedDescription ?? "Something went wrong")
        }
    }
}
