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
    
    var selectedQuestion: StackOverFlowQuestionDetailsModel?
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
    
    func currentSelectedQuestion(at index: Int) {
        let date = NSDate(timeIntervalSince1970: (Double(self.stackOverFlowQuestionsDetails?.items[index].creationDate ?? 0)))
        self.selectedQuestion = StackOverFlowQuestionDetailsModel(bodyContent: self.stackOverFlowQuestionsDetails?.items[index].body ?? "",
                                                                  title: self.stackOverFlowQuestionsDetails?.items[index].title ?? "",
                                                                  acceptRate: String(self.stackOverFlowQuestionsDetails?.items[index].owner.acceptRate ?? 0),
                                                                  tags: self.stackOverFlowQuestionsDetails?.items[index].tags ?? [""],
                                                                  ownerName: self.stackOverFlowQuestionsDetails?.items[index].owner.displayName ?? "",
                                                                  creationDate: date as Date,
                                                                  imageURL: self.stackOverFlowQuestionsDetails?.items[index].owner.profileImage ?? "")
    }
    
    func questionCard(at index: Int) -> ListContentModel {
        return ListContentModel(titleLabel: getHtmlFormat(fromString: self.stackOverFlowQuestionsDetails?.items[index].title ?? "") ?? "",
                                votesLabel:  "\(String(self.stackOverFlowQuestionsDetails?.items[index].score ?? 0)) Votes",
                                answersLabel:  "\(String(self.stackOverFlowQuestionsDetails?.items[index].answerCount ?? 0)) answers",
                                viewsLabel: "\(String(self.stackOverFlowQuestionsDetails?.items[index].viewCount ?? 0)) views",
                                askedByLabel: "asked by \(self.stackOverFlowQuestionsDetails?.items[index].owner.displayName ?? "")")
    }
    
    func getHtmlFormat(fromString htmlString: String) -> String? {
        guard let htmlData = htmlString.data(using: String.Encoding.unicode) else { return nil }
        return try? NSAttributedString(data: htmlData, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil).string
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
