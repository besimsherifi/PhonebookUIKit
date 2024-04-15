//
//  ContactsViewController.swift
//  Phonebook UIKit
//
//  Created by besim on 13/04/2024.


import UIKit

struct Contact {
    var name: String
    var phoneNumber: String
    var notes: String?
}

class ContactsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    
    private var contacts: [Contact] = [
        Contact(name: "Alice Smith", phoneNumber: "123-456-7890", notes: "These are some test notes"),
        Contact(name: "Bob Johnson", phoneNumber: "098-765-4321", notes: "These are some test notes"),
    ]
    
    private var tableView: UITableView!
    private var filteredContacts: [Contact] = []
     private var isSearching = false
     private var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupSearchBar()
        setupLayout()
        setupNavigationBar()
    }
    
    private func setupSearchBar() {
        searchBar = UISearchBar()
        searchBar.delegate = self
        searchBar.placeholder = "Search Contacts"
        searchBar.sizeToFit()
        tableView.tableHeaderView = searchBar
    }
    
    private func setupNavigationBar() {
        title = "Contacts"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addContactTapped))
        guard let navigationBar = navigationController?.navigationBar else { return }
        navigationBar.prefersLargeTitles = true

    }
    
    
    
    @objc private func addContactTapped() {
        let addContactVC = AddContactViewController()
        addContactVC.saveContactHandler = { [weak self] newContact in
            self?.contacts.append(newContact)
            self?.tableView.reloadData()
        }
        let navigationController = UINavigationController(rootViewController: addContactVC)
        navigationController.modalPresentationStyle = .formSheet
        present(navigationController, animated: true)
    }
    
    private func setupTableView() {
        tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ContactCell")
        tableView.tableFooterView = UIView()
        view.addSubview(tableView)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            if searchText.isEmpty {
                isSearching = false
            } else {
                isSearching = true
                filteredContacts = contacts.filter { $0.name.lowercased().contains(searchText.lowercased()) }
            }
            tableView.reloadData()
        }

        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            isSearching = false
            searchBar.text = ""
            searchBar.resignFirstResponder()
            tableView.reloadData()
        }
    
    private func setupLayout() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return isSearching ? filteredContacts.count : contacts.count
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath)
          let contact = isSearching ? filteredContacts[indexPath.row] : contacts[indexPath.row]
          cell.textLabel?.text = contact.name
          return cell
      }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contact = contacts[indexPath.row]
        showContactDetail(contact)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    private func showContactDetail(_ contact: Contact) {
        let detailViewController = ContactDetailViewController()
        detailViewController.contact = contact
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}



