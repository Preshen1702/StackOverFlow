//
//  SearchBarView.swift
//  SOFComponentsKit
//
//  Created by Preshen Naidoo on 2021/10/20.
//

import Foundation

public protocol SearchBarViewDelegate: NSObjectProtocol {
    func tappedSearchBar(with keyword: String)
    func clearSearchBar()
}

import UIKit

public final class SearchBarView: UIView {
    
    @IBOutlet private var searchBar: UISearchBar!
    @IBOutlet private var cancelButton: UIButton!
    
    public weak var delegate: SearchBarViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupSearchBarView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupSearchBarView()
    }
    
    public func clearSearchBar() {
        self.searchBar.text = ""
    }
    
    @IBAction private func cancelButtonTapped(_ sender: UIButton) {
        self.delegate?.clearSearchBar()
    }
    
    private func setupSearchBarView() {
        self.setupNib()
        self.searchBar.delegate = self
        searchBar.setTextField(color: UIColor.white.withAlphaComponent(1))
    }
    
}

extension SearchBarView: UISearchBarDelegate, UIScrollViewDelegate {
    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        delegate?.tappedSearchBar(with: searchBar.text ?? "")
    }
}

extension UISearchBar {
    func getTextField() -> UITextField? { return value(forKey: "searchField") as? UITextField }
    func setTextField(color: UIColor) {
        guard let textField = getTextField() else { return }
        switch searchBarStyle {
        case .minimal:
            textField.layer.backgroundColor = color.cgColor
            textField.layer.cornerRadius = 6
        case .prominent, .default: textField.backgroundColor = color
        @unknown default: break
        }
    }
}

