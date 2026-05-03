//
//  ViewController.swift
//  ImageFeed
//
//  Created by Ксения Штыркова on 17.04.2026.
//

import UIKit

// MARK: - ViewController
class ImagesListViewController: UIViewController {
    @IBOutlet private var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 200
    }
}

// MARK: - DataSource
extension ImagesListViewController: UITableViewDataSource {
    //количество строк в секции (количество ячеек)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    // создание и настройка ячеек
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ImagesListCell.reuseIdentifier, for: indexPath)
        
        guard let imageListCell = cell as? ImagesListCell else {
            print("⛔️ Ошибка приведения типов. Не получилось кастомизировать ячейку")
            return UITableViewCell()
        }
        
        configCell(for: imageListCell)
        return imageListCell
    }
    
    func configCell(for cell: ImagesListCell) { }
}

// MARK: - Delegate
extension ImagesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { }
}


