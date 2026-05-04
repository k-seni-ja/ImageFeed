//
//  ImagesListViewController.swift
//  ImageFeed
//
//  Created by Ксения Штыркова on 17.04.2026.
//

import UIKit

final class ImagesListViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Properties
    ///массив с именами mock-фото
    private let photoNames = (0..<20).map{ String($0) }
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter
    }()
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        /// отступ контента от границ ячейки
        tableView.contentInset = UIEdgeInsets(top: 12, left: 0, bottom: 12, right: 0)
    }
    
    // MARK: - Methods
    ///заполнение ячейки данными
    func configCell(for cell: ImagesListCell, with indexPath: IndexPath) {
        guard let image = UIImage(named: photoNames[indexPath.row]) else {
            print("⛔️ Не удалось загрузить картинку с таким именем \(photoNames[indexPath.row])")
            return}
        
        cell.cellImage.image = image // загрузка картинки по имени
        cell.dateLabel.text = dateFormatter.string(from: Date())
        
        if indexPath.row % 2 == 0 {
            cell.likeButton.setImage(UIImage(named: "like_button_on"), for: .normal)
        } else {
            cell.likeButton.setImage(UIImage(named: "like_button_off"), for: .normal)
        }
    }
}


// MARK: - UITableViewDataSource
extension ImagesListViewController: UITableViewDataSource {
    ///количество строк в секции (количество ячеек)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photoNames.count
    }
    
    /// создание и настройка ячеек
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /// переиспользование ячейки
        let cell = tableView.dequeueReusableCell(withIdentifier: ImagesListCell.reuseIdentifier, for: indexPath)
        
        /// преобразуем обычную ячейку  UITableViewCell в кастомную ImagesListCell
        guard let imageListCell = cell as? ImagesListCell else {
            print("⛔️ Ошибка приведения типов. Не получилось кастомизировать ячейку")
            return UITableViewCell()
        }
        configCell(for: imageListCell, with: indexPath)
        return imageListCell
    }
}


// MARK: - UITableViewDelegate
extension ImagesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { }
    
    /// настройка динамической высоты ячейки
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let image = UIImage(named: photoNames[indexPath.row]) else {
            return 0
        }
        let imageInsets = UIEdgeInsets(top: 4, left: 16, bottom: 4, right: 16)
        let imageViewWidth = tableView.bounds.width - imageInsets.left - imageInsets.right
        let imageWidth = image.size.width
        let scale = imageViewWidth / imageWidth
        let cellHeight = image.size.height * scale + imageInsets.top + imageInsets.bottom
        return cellHeight
    }
}


