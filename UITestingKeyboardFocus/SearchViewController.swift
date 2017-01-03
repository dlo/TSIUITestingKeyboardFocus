//
//  SearchViewController.swift
//  UITestingKeyboardFocus
//
//  Created by Daniel Loewenherz on 1/3/17.
//  Copyright © 2017 Lionheart Software LLC. All rights reserved.
//

import UIKit

let CellIdentifier = "CellIdentifier"

final class SearchResultsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var tableView: UITableView!

    init() {
        super.init(nibName: nil, bundle: nil)

        edgesForExtendedLayout = []
        definesPresentationContext = false

        tableView = UITableView(frame: view.frame, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: CellIdentifier)

        view.addSubview(tableView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier, for: indexPath)
        cell.textLabel?.text = "Search Result #" + String(indexPath.row + 1)
        return cell
    }
}

final class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating {
    var searchController: UISearchController?
    var tableView: UITableView!

    init() {
        super.init(nibName: nil, bundle: nil)

        title = "Search"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(rightBarButtonItemDidTouchUpInside))

        edgesForExtendedLayout = []
        definesPresentationContext = true

        tableView = UITableView(frame: view.frame, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: CellIdentifier)

        let resultsController = SearchResultsViewController()
        let _searchController = UISearchController(searchResultsController: resultsController)
        _searchController.searchResultsUpdater = self

        _searchController.searchBar.autocapitalizationType = .allCharacters
        _searchController.searchBar.keyboardType = .asciiCapable
        _searchController.searchBar.sizeToFit()
        tableView.tableHeaderView = _searchController.searchBar

        searchController = _searchController

        view.addSubview(tableView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier, for: indexPath)
        cell.textLabel?.text = "Row #" + String(indexPath.row + 1)
        return cell
    }

    // MARK: -

    func rightBarButtonItemDidTouchUpInside() {
        self.dismiss(animated: true, completion: nil)
    }

    // MARK: - UISearchResultsUpdating

    func updateSearchResults(for searchController: UISearchController) {
        guard let controller = searchController.searchResultsController as? SearchResultsViewController,
            let text = searchController.searchBar.text else {
                return
        }

        controller.tableView.reloadData()
    }
}
