//
//  ViewController.swift
//  StackOverFlow
//
//  Created by Preshen Naidoo on 2021/10/20.
//

import UIKit
import SOFComponentsKit

class ViewController: UIViewController {
    
    @IBOutlet private var listview: ListView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listview.populate(with: ListContentModel(titleLabel: "Correct Syntax",
                                                 votesLabel: "0 Votes",
                                                 answersLabel: "2 Answers",
                                                 viewsLabel: "10 views",
                                                 askedByLabel: "asked by Nathan"))
        listview.populate(with: ListContentModel(titleLabel: "Correct Syntax",
                                                 votesLabel: "0 Votes",
                                                 answersLabel: "2 Answers",
                                                 viewsLabel: "10 views",
                                                 askedByLabel: "asked by Nathan"))
    }
}

