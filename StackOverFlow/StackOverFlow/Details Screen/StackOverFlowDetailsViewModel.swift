//
//  StackOverFlowDetailsViewModel.swift
//  StackOverFlow
//
//  Created by Preshen Naidoo on 2021/10/21.
//

import Foundation
import SOFNetworkKit
import UIKit

class StackOverFlowDetailsViewModel {
    
    private var stackOverFlowQuestionDetails: StackOverFlowQuestionDetailsModel
    private var interactor: BaseNetworkLayer?
    private weak var delegate: BaseViewModelDelegate?
    var profileImage: UIImage?
    
    init(stackOverFlowQuestionDetails: StackOverFlowQuestionDetailsModel,
         interactor: BaseNetworkLayer,
         delegate: BaseViewModelDelegate) {
        self.stackOverFlowQuestionDetails = stackOverFlowQuestionDetails
        self.interactor = interactor
        self.delegate = delegate
    }
    
    var bodyContent: String {
        return stackOverFlowQuestionDetails.bodyContent.getHtmlFormat() ?? ""
    }
    
    var titleContent: String {
        return stackOverFlowQuestionDetails.title.getHtmlFormat() ?? ""
    }
    
    var acceptRate: String {
        return stackOverFlowQuestionDetails.acceptRate
    }
    
    var ownerName: String {
        return stackOverFlowQuestionDetails.ownerName
    }
    
    var imageURL: String {
        return stackOverFlowQuestionDetails.imageURL
    }
    
    var tags: String {
        return stackOverFlowQuestionDetails.tags.joined(separator: ", ")
    }
    
    var date: String {
        return stackOverFlowQuestionDetails.creationDate?.convertDate(by: "dd MMMM YYYY hh:mm a") ?? ""
    }
    
    func searchStackOverFlow(with imageURL: String) {
        interactor?.fetchAsset(url: imageURL) { [weak self] (imageData) in
            self?.profileImage = UIImage(data: imageData)
            self?.delegate?.refreshViewContents()
        } failure: { [weak self] (error) in
            self?.delegate?.showErrorMessage(errorMessage: error?.localizedDescription ?? "Something went wrong")
        }
    }
}
