//
//  StackOverFlowDetailsViewController.swift
//  StackOverFlow
//
//  Created by Preshen Naidoo on 2021/10/21.
//

import Foundation
import UIKit
import SOFComponentsKit
import SOFNetworkKit

final class StackOverFlowDetailsViewController: BaseViewController {
    
    @IBOutlet private var contentBodyView: ContentView!
    @IBOutlet private var headingTitleView: HeadingView!
    @IBOutlet private var scrollView: UIScrollView!
    @IBOutlet private var footerView: FooterView!
    @IBOutlet private var tagsView: TagsView!
    private var stackOverFlowQuestionDetails: StackOverFlowQuestionDetailsModel!
    
    private lazy var viewModel = StackOverFlowDetailsViewModel(stackOverFlowQuestionDetails: self.stackOverFlowQuestionDetails,
                                                               interactor: BaseNetworkLayer(),
                                                               delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.searchStackOverFlow(with: viewModel.imageURL)
        self.setupView()
    }
    
    func setModel(stackOverFlowQuestionDetails: StackOverFlowQuestionDetailsModel) {
        self.stackOverFlowQuestionDetails = stackOverFlowQuestionDetails
    }
    
    private func setupView() {
        contentBodyView.contentLabelText = viewModel.bodyContent
        scrollView.contentSize = contentBodyView.frame.size
        headingTitleView.headingLabelText = viewModel.titleContent
        
        footerView.populate(with: FooterContentModel(image: viewModel.profileImage ?? UIImage(),
                                                     title: viewModel.ownerName,
                                                     description: viewModel.acceptRate,
                                                     subDescription: viewModel.date))
        tagsView.tagsLabelText = viewModel.tags
    }
}

extension StackOverFlowDetailsViewController: BaseViewModelDelegate {
    func refreshViewContents() {
        DispatchQueue.main.async {
            self.footerView.image = self.viewModel.profileImage
        }
    }
    
    func showErrorMessage(errorMessage: String) {
        
    }
}
