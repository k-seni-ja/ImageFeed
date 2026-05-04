//
//  ProfileViewController.swift
//  ImageFeed
//
//  Created by Ксения Штыркова on 04.05.2026.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var loginNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var logoutButton: UIButton!
  
    // MARK: - Actions
    @IBAction func didTapLogoutButton(_ sender: UIButton) {
    }
}
