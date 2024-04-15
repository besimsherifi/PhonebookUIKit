//
//  ContactDetailViewController.swift
//  Phonebook UIKit
//
//  Created by besim on 15/04/2024.
//

import UIKit

class ContactDetailViewController: UIViewController {
    var contact: Contact?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        guard let contact = contact else { return }
        view.backgroundColor = .white

        let firstCharacterLabel = UILabel()
        firstCharacterLabel.text = String(contact.name.prefix(1)).uppercased()
        firstCharacterLabel.textAlignment = .center
        firstCharacterLabel.textColor = .white
        firstCharacterLabel.backgroundColor = .gray
        firstCharacterLabel.layer.cornerRadius = 40
        firstCharacterLabel.clipsToBounds = true
        firstCharacterLabel.font = UIFont.systemFont(ofSize: 36)
        firstCharacterLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(firstCharacterLabel)

        let nameLabel = UILabel()
        nameLabel.text = contact.name
        nameLabel.font = UIFont.boldSystemFont(ofSize: 24)
        nameLabel.textAlignment = .center
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)

        let buttonTitlesAndIcons = [
            ("call", "phone.fill"),
            ("text", "message.fill"),
            ("email", "envelope.fill"),
            ("delete", "trash.fill")
        ]
        let buttons = buttonTitlesAndIcons.map { title, iconName -> UIButton in
            let button = UIButton(type: .system)
            var config = UIButton.Configuration.filled()
            config.baseBackgroundColor = .systemGray
            config.imagePlacement = .top
            config.title = title
            config.image = UIImage(systemName: iconName)
            config.buttonSize = .medium
            config.cornerStyle = .medium
            button.configuration = config
            button.layer.cornerRadius = 10
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }

        let buttonStack = UIStackView(arrangedSubviews: buttons)
        buttonStack.axis = .horizontal
        buttonStack.distribution = .fillEqually
        buttonStack.spacing = 15
        buttonStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonStack)


        let notesLabel = UILabel()
        notesLabel.text = "Notes"
        notesLabel.font = UIFont.boldSystemFont(ofSize: 18)
        notesLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(notesLabel)
        
        let phoneContentLabel = UILabel()
        phoneContentLabel.text = contact.phoneNumber
        phoneContentLabel.numberOfLines = 0
        phoneContentLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(phoneContentLabel)
        
        let phoneLabel = UILabel()
        phoneLabel.text = "Phone"
        phoneLabel.font = UIFont.boldSystemFont(ofSize: 18)
        phoneLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(phoneLabel)

        let notesContentLabel = UILabel()
        notesContentLabel.text = contact.notes
        notesContentLabel.numberOfLines = 0
        notesContentLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(notesContentLabel)

        NSLayoutConstraint.activate([
            firstCharacterLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstCharacterLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            firstCharacterLabel.widthAnchor.constraint(equalToConstant: 80),
            firstCharacterLabel.heightAnchor.constraint(equalToConstant: 80),

            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: firstCharacterLabel.bottomAnchor, constant: 20),

            buttonStack.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            buttonStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonStack.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40),
            buttonStack.heightAnchor.constraint(equalToConstant: 50),

            phoneLabel.centerXAnchor.constraint(equalTo: view.leadingAnchor, constant: 45),
            phoneLabel.topAnchor.constraint(equalTo: buttonStack.bottomAnchor, constant: 40),

            notesLabel.centerXAnchor.constraint(equalTo: view.leadingAnchor, constant: 45),
            notesLabel.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 40),

            phoneContentLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            phoneContentLabel.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor),
            phoneContentLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40),
            
            notesContentLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            notesContentLabel.topAnchor.constraint(equalTo: notesLabel.bottomAnchor),
            notesContentLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40)
            
            
        ])
    }
}


