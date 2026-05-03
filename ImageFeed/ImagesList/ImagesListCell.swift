//
//  ImagesListCell.swift
//  ImageFeed
//
//  Created by Ксения Штыркова on 27.04.2026.
//
import UIKit
// настройка кастомной ячейки
final class ImagesListCell: UITableViewCell {
    //MARK: - IBOutlets
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var dateLabel: UILabel!
    
    //MARK: - Properties
    static let reuseIdentifier: String = "ImagesListCell"
    private let gradientLayer = CAGradientLayer()
    
    //MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        cellImage.layer.cornerRadius = 16
        cellImage.layer.masksToBounds = true
        setupGradientLayer()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = cellImage.bounds //обновить размер градиента при изменении размера ячейки
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        cellImage.image = nil
        likeButton.setImage(nil, for: .normal)
        dateLabel.text = nil
    }
    
    //MARK: - Methods
    private func setupGradientLayer() {
        // градиент от прозрачого к черному
        gradientLayer.colors = [UIColor.clear.cgColor,
                                UIColor.ypBlackIOS.withAlphaComponent(0.5).cgColor]
        gradientLayer.locations = [0.6, 1.0]
        cellImage.layer.addSublayer(gradientLayer)
    }
    
    func configure(image: UIImage?, isLiked: Bool, date: String) {
        cellImage.image = image
        likeButton.isSelected = isLiked
        dateLabel.text = date
    }
    
    //MARK: - Actions
    @IBAction func likeButtonTap(_ sender: UIButton) {
        sender.isSelected.toggle()
    }
    
    
}

