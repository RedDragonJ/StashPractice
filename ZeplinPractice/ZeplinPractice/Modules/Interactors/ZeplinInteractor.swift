//
//  ZeplinInteractor.swift
//  ZeplinPractice
//
//  Created by James H Layton on 6/14/18.
//  Copyright © 2018 james. All rights reserved.
//

import Foundation

//MARK: - PresenterToInteractorProtocol
class ZeplinInteractor: PresenterToInteractorProtocol {
    
    var presenter: InteractorToPresenterProtocol?
    
    func fetchJSON() {
        guard let filePath = Bundle.main.path(forResource: "achievements", ofType: "json") else {
            self.presenter?.failedRetrieveDataWith(error: "No file at path")
            return
        }
        
        let url = URL(fileURLWithPath: filePath)
        do {
            let data = try Data(contentsOf: url)
            let achievementData = try JSONDecoder().decode(AchievenmentData.self, from: data)
            
            self.presenter?.retrieveDataWith(achievements: achievementData.achievements)
        }
        catch let error {
            self.presenter?.failedRetrieveDataWith(error: "Error when trying to get data \(error.localizedDescription)")
        }
    }
}
