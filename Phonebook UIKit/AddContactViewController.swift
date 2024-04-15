//
//  AddContactViewController.swift
//  Phonebook UIKit
//
//  Created by besim on 13/04/2024.
//

import UIKit

//class AddContactViewController: UIViewController {
//
//    var saveContactHandler: ((Contact) -> Void)?
//
//    private let nameTextField: UITextField = {
//        let textField = UITextField()
//        textField.placeholder = "Enter name"
//        textField.borderStyle = .roundedRect
//        return textField
//    }()
//
//    private let phoneNumberTextField: UITextField = {
//        let textField = UITextField()
//        textField.placeholder = "Enter phone number"
//        textField.borderStyle = .roundedRect
//        return textField
//    }()
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//        setupLayout()
//        setupNavigationBar()
//
//    }
//
//    private func setupNavigationBar() {
//        navigationItem.title = "Add Contact"
//        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelTapped))
//        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveContact))
//    }
//
//    @objc private func cancelTapped() {
//        dismiss(animated: true)
//    }
//
//    private func setupLayout() {
//        let stackView = UIStackView(arrangedSubviews: [nameTextField, phoneNumberTextField])
//        stackView.axis = .vertical
//        stackView.spacing = 20
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(stackView)
//
//        NSLayoutConstraint.activate([
//            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            stackView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40)
//        ])
//    }
//
//    @objc private func saveContact() {
//        guard let name = nameTextField.text, !name.isEmpty,
//              let phoneNumber = phoneNumberTextField.text, !phoneNumber.isEmpty else {
//            print("Add name and phone number")
//            return
//        }
//        let newContact = Contact(name: name, phoneNumber: phoneNumber)
//        saveContactHandler?(newContact)
//        dismiss(animated: true)
//    }
//}





class AddContactViewController: UIViewController {
    
    var saveContactHandler: ((Contact) -> Void)?
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "person.crop.circle.fill")
        imageView.tintColor = .gray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let addPhotoButton: UIButton = {
        var config = UIButton.Configuration.tinted()
        let button = UIButton(type: .system)
        button.setTitle("Add Photo", for: .normal)
        button.layer.cornerRadius = 20
        button.backgroundColor = .lightGray
        config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter name"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let phoneNumberTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter phone number"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let notesTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.layer.cornerRadius = 8.0
        textView.layer.borderWidth = 1.0
        textView.layer.borderColor = UIColor.systemGray4.cgColor
        textView.isScrollEnabled = true
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private let notesPlaceholderLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter notes..."
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .placeholderText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
        setupNavigationBar()
        notesTextView.delegate = self
        
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Add Contact"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelTapped))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveContact))
    }
    
    @objc private func cancelTapped() {
        dismiss(animated: true)
    }
    

    
    private func setupLayout() {
        let stackView = UIStackView(arrangedSubviews: [iconImageView, addPhotoButton, nameTextField, phoneNumberTextField, notesTextView])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        notesTextView.addSubview(notesPlaceholderLabel)
        
        NSLayoutConstraint.activate([
            iconImageView.heightAnchor.constraint(equalToConstant: 80),
            iconImageView.widthAnchor.constraint(equalToConstant: 80),
            addPhotoButton.heightAnchor.constraint(equalToConstant: 44),
            notesTextView.heightAnchor.constraint(equalToConstant: 100), 

            notesPlaceholderLabel.topAnchor.constraint(equalTo: notesTextView.topAnchor, constant: 8),
            notesPlaceholderLabel.leadingAnchor.constraint(equalTo: notesTextView.leadingAnchor, constant: 5),
            
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40)
        ])
    }

    
    @objc private func saveContact() {
        guard let name = nameTextField.text, !name.isEmpty,
              let phoneNumber = phoneNumberTextField.text, !phoneNumber.isEmpty,
              let notes = notesTextView.text, !notes.isEmpty else {
            print("Add name and phone number")
            return
        }
        let newContact = Contact(name: name, phoneNumber: phoneNumber, notes: notes)
        saveContactHandler?(newContact)
        dismiss(animated: true)
    }
}


extension AddContactViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        notesPlaceholderLabel.isHidden = !textView.text.isEmpty
    }
}
