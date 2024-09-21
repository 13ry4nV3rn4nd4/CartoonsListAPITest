//
//  CartoonDetail_Router.swift
//  CartoonsListAPITest
//
//  Created by Bryan Vernanda on 21/09/24.
//

import Foundation

// EntryPoint
protocol CartoonDetail_Router_Protocol {
    var entry: CartoonDetailViewController? {get}
    static func createCartoonDetail(with cartoon: Cartoon) -> CartoonDetail_Router_Protocol
}

class CartoonDetail_Router: CartoonDetail_Router_Protocol {
    var entry: CartoonDetailViewController?
    
    static func createCartoonDetail(with cartoon: Cartoon) -> CartoonDetail_Router_Protocol {
        let router = CartoonDetail_Router()
        let view = CartoonDetailViewController()
        let presenter = CartoonDetail_Presenter()
        let interactor = CartoonDetail_Interactor()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        interactor.cartoon = cartoon
        
        router.entry = view
        
        return router
    }
    
}
