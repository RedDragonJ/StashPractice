//
//  ZeplinLevelListViewController.swift
//  ZeplinPractice
//
//  Created by James H Layton on 6/14/18.
//  Copyright © 2018 james. All rights reserved.
//

import UIKit

class ZeplinLevelListViewController: UIViewController {

    @IBOutlet weak var zeplinTableView: UITableView!
    
    var presenter: ViewToPresenterProtocol?
    var achievements = [Achievenments]()
    
    //MARK: - ZeplinLevelListViewController Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.updateView()
    }
}

// MARK: - UITableViewDataSource
extension ZeplinLevelListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.achievements.count > 0 {
            return self.achievements.count
        }
        else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LevelCell") as! ZeplinLevelTableViewCell
        
        if self.achievements.count > 0 {
            
            cell.imageUrl = self.achievements[indexPath.row].bg_image_url
            cell.accessible = self.achievements[indexPath.row].accessible
            cell.levelLabel.text = self.achievements[indexPath.row].level
            cell.currentPointLabel.text = String(format: "%ipt", self.achievements[indexPath.row].progress)
            cell.maxPointLabel.text = String(format: "%ipt", self.achievements[indexPath.row].total)
            
            let calculator = Calculation()
            cell.progress = calculator.calculateProgress(self.achievements[indexPath.row].progress, self.achievements[indexPath.row].total)
            
            return cell
        }
        else {
            return UITableViewCell()
        }
    }
}

// MARK: - PresenterToViewProtocol
extension ZeplinLevelListViewController: PresenterToViewProtocol {
    func showData(achievements: [Achievenments]) {
        self.achievements = achievements
        self.zeplinTableView.reloadData()
    }
    
    func showError(error: String) {
        print(error)
    }
}
