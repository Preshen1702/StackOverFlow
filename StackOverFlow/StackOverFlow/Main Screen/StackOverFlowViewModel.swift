//
//  StackOverFlowViewModel.swift
//  StackOverFlow
//
//  Created by Preshen Naidoo on 2021/10/20.
//

import Foundation
import SOFNetworkKit
import SOFComponentsKit

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
    
    var numberOfRows: Int {
        return self.stackOverFlowQuestionsDetails?.items.count ?? 0
    }
    
    var hasNoContent: Bool {
        return self.stackOverFlowQuestionsDetails?.items.isEmpty ?? false
    }
    
    func questionCard(at index: Int) -> ListContentModel {
        return ListContentModel(titleLabel: self.stackOverFlowQuestionsDetails?.items[index].title ?? "",
                                votesLabel:  "\(String(self.stackOverFlowQuestionsDetails?.items[index].score ?? 0)) Votes",
                                answersLabel:  "\(String(self.stackOverFlowQuestionsDetails?.items[index].answerCount ?? 0)) answers",
                                viewsLabel: "\(String(self.stackOverFlowQuestionsDetails?.items[index].viewCount ?? 0)) views",
                                askedByLabel: "asked by \(self.stackOverFlowQuestionsDetails?.items[index].owner.displayName ?? "")")
    }
    
    func searchStackOverFlow(with keyword: String) {
        interactor?.post(searchString: keyword) { [weak self] (responseData) in
            let decoder = JSONDecoder()
            self?.stackOverFlowQuestionsDetails = try! decoder.decode(StackOverFlowQuestionsModel.self, from: responseData)
            self?.delegate?.refreshViewContents()
        } failure: { [weak self] (error) in
            self?.delegate?.showErrorMessage(errorMessage: error?.localizedDescription ?? "Something went wrong")
        }
    }
}
