//
//  ImagesListCell.swift
//  ImageFeed
//
//  Created by Ксения Штыркова on 27.04.2026.
//
import UIKit

/// Кастомная ячейка списка изображений
final class ImagesListCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var dateLabel: UILabel!
    
    // MARK: - Properties
    static let reuseIdentifier = "ImagesListCell"
    private let gradientLayer = CAGradientLayer()
    
    // MARK: - LifeCycle
    ///однократная настройка ячейки после создания
    override func awakeFromNib() {
        super.awakeFromNib()
        cellImage.layer.cornerRadius = 16
        cellImage.layer.masksToBounds = true
        setupGradientLayer()
    }
    
    /// обновление размеров дочерних элементов ячейки
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = cellImage.bounds
    }
    
    /// сброс данных при переиспользовании ячейки
    override func prepareForReuse() {
        super.prepareForReuse()
        cellImage.image = nil
        likeButton.setImage(nil, for: .normal)
        dateLabel.text = nil
    }
    
    // MARK: - Methods
    /// настройка градиента (от прозрачного к черному)
    private func setupGradientLayer() {
        gradientLayer.colors = [UIColor.clear.cgColor,
                                UIColor.ypBlackIOS.withAlphaComponent(0.5).cgColor]
        gradientLayer.locations = [0.8, 1.0]
        cellImage.layer.addSublayer(gradientLayer)
    }
 
    // MARK: - Actions
    @IBAction func likeButtonTap(_ sender: UIButton) { }
    
    
}

