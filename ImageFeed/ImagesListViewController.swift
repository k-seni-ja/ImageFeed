//
//  ViewController.swift
//  ImageFeed
//
//  Created by Ксения Штыркова on 17.04.2026.
//

import UIKit

extension ImagesListViewController: UITableViewDataSource {
    //количество строк в секции (количество ячеек)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    // создание и настройка ячеек
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}

// действия при нажатии на ячейку
extension ImagesListViewController: UITabBarDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

class ImagesListViewController: UIViewController {
    
    @IBOutlet private var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

