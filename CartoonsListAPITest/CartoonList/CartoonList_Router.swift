//
//  CartoonList_Router.swift
//  CartoonsListAPITest
//
//  Created by Bryan Vernanda on 20/09/24.
//

import Foundation
import UIKit

// EntryPoint
protocol CartoonList_Router_Protocol {
    var entry: CartoonListViewController? {get}
    static func startExecution() -> CartoonList_Router_Protocol
    
    func gotoDetailView(cartoon: Cartoon)
}

class CartoonList_Router: CartoonList_Router_Protocol {
    var entry: CartoonListViewController?
    
    static func startExecution() -> CartoonList_Router_Protocol {
        let router = CartoonList_Router()
        let view = CartoonListViewController()
        let presenter = CartoonList_Presenter()
        let interactor = CartoonList_Interactor()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        router.entry = view
        return router
    }
    
    func gotoDetailView(cartoon: Cartoon) {
        let detailRouter = CartoonDetail_Router.createCartoonDetail(with: cartoon)
        guard let detailView = detailRouter.entry else { return }
        guard let viewController = self.entry else { return }
        
        viewController.navigationController?.pushViewController(detailView, animated: true)
    }
}
