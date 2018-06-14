//
//  ZeplinProtocols.swift
//  ZeplinPractice
//
//  Created by James H Layton on 6/14/18.
//  Copyright © 2018 james. All rights reserved.
//

import Foundation
import UIKit

//MARK: - View and Presenter
protocol ViewToPresenterProtocol: class {
    var view: PresenterToViewProtocol? {get set}
    var interactor: PresenterToInteractorProtocol? {get set}
    var router: PresenterToRouterProtocol? {get set}
    func updateView()
}

protocol PresenterToViewProtocol: class {
    func showData(achievements: [Achievenments])
    func showError(error: String)
}

// MARK: - Interactor and Presenter
protocol InteractorToPresenterProtocol: class {
    func retrieveDataWith(achievements: [Achievenments])
    func failedRetrieveDataWith(error: String)
}

protocol PresenterToInteractorProtocol: class {
    var presenter: InteractorToPresenterProtocol? {get set}
    func fetchJSON()
}

// MARK: - Presenter and Router
protocol PresenterToRouterProtocol {
    static func createModule() -> UIViewController
}
