//
//  CartoonList_Presenter.swift
//  CartoonsListAPITest
//
//  Created by Bryan Vernanda on 20/09/24.
//

import Foundation

// Talk to router
// Talk to view
// Talk to interactor
protocol CartoonList_Presenter_Protocol {
    var router: CartoonList_Router_Protocol? {get set}
    var view: CartoonList_View_Protocol? {get set}
    var interactor: CartoonList_Interactor_Protocol? {get set}
    
    func viewDidLoad()
    func interactorWithData(result: Result<[Cartoon], Error>)
    func tapOnDetail(_ cartoon: Cartoon)
}

class CartoonList_Presenter: CartoonList_Presenter_Protocol {
    var router: CartoonList_Router_Protocol?
    var view: CartoonList_View_Protocol?
    var interactor: CartoonList_Interactor_Protocol?
    
    func viewDidLoad() {
        interactor?.getCartoonsListData()
    }
    
    func interactorWithData(result: Result<[Cartoon], any Error>) {
        switch result {
        case .success(let cartoons):
            view?.update(with: cartoons)
        case .failure(let error):
            print(error)
            view?.update(with: "Try again later...")
        }
    }
    
    func tapOnDetail(_ cartoon: Cartoon) {
        router?.gotoDetailView(cartoon: cartoon)
    }
    
}
