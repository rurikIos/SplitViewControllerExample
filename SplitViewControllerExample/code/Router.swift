//
//  Router.swift
//  SplitViewControllerExample
//
//  Created by Чайков Ю.И. on 25.07.2024.
//

import UIKit

final class Router {
    lazy var rootNavigationController = UINavigationController()
    
    init() {
        let view = MainViewController()
        
        view.showSplitVC = { [weak self] splitVC in
            guard let self else {
                return
            }
            let container = UIViewController()
            container.addAsChildViewController(type: splitVC, attached: container.view)
            self.rootNavigationController.pushViewController(container, animated: true)
//            view.present(splitVC, animated: true)
        }
        
        rootNavigationController.pushViewController(view, animated: false)
    }
}

extension UIViewController {
    /// this add a child controller to the view of another controller
    func addAsChildViewController(type controller: UIViewController, attached toView: UIView) {
        
        // Add Child View Controller
        addChild(controller)
        
        // Add Child View as Subview
        toView.addSubview(controller.view)
        
        // Configure Child View
        controller.view.frame = toView.bounds
        controller.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Notify Child View Controller
        controller.didMove(toParent: self)
        
    }
}
