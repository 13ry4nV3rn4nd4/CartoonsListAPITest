//
//  CartoonDetail_Interactor.swift
//  CartoonsListAPITest
//
//  Created by Bryan Vernanda on 21/09/24.
//

import Foundation

// Talk to presenter
protocol CartoonDetail_Interactor_Protocol {
    var presenter: CartoonDetail_Presenter_Protocol? {get set}
    var cartoon: Cartoon? {get set}
    
    func getCartoonData()
}

class CartoonDetail_Interactor: CartoonDetail_Interactor_Protocol {
    var presenter: (any CartoonDetail_Presenter_Protocol)?
    
    var cartoon: Cartoon?
    
    func getCartoonData() {
        presenter?.interactorUpdateData(cartoon: cartoon)
    }
    
}
