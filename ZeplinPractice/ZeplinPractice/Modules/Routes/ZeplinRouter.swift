//
//  ZeplinRouter.swift
//  ZeplinPractice
//
//  Created by James H Layton on 6/14/18.
//  Copyright © 2018 james. All rights reserved.
//

import Foundation
import UIKit

//MARK: - PresenterToRouterProtocol
class ZeplinRouter: PresenterToRouterProtocol {
    
    class func createModule() -> UIViewController{
        
        let navController = mainstoryboard.instantiateViewController(withIdentifier: "MainNav") as! UINavigationController
        
        if let view = navController.childViewControllers.first as? ZeplinLevelListViewController {
            let presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = ZeplinPresenter()
            let interactor: PresenterToInteractorProtocol = ZeplinInteractor()
            let router: PresenterToRouterProtocol = ZeplinRouter()
        
            view.presenter = presenter
            presenter.view = view
            presenter.router = router
            presenter.interactor = interactor
            interactor.presenter = presenter
        }
        return navController
    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
}

