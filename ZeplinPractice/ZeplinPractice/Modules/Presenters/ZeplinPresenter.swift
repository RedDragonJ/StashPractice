//
//  ZeplinPresenter.swift
//  ZeplinPractice
//
//  Created by James H Layton on 6/14/18.
//  Copyright © 2018 james. All rights reserved.
//

import Foundation

// MARK: - ViewToPresenterProtocol
class ZeplinPresenter: ViewToPresenterProtocol {
    
    var view: PresenterToViewProtocol?;
    var interactor: PresenterToInteractorProtocol?;
    var router: PresenterToRouterProtocol?
    
    func updateView() {
        self.interactor?.fetchJSON()
    }
}

// MARK: - InteractorToPresenterProtocol
extension ZeplinPresenter: InteractorToPresenterProtocol {
    func retrieveDataWith(achievements: [Achievenments]) {
        self.view?.showData(achievements: achievements)
    }
    
    func failedRetrieveDataWith(error: String) {
        self.view?.showError(error: error)
    }
}


