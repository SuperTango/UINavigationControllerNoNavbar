//
//  NavigationViewController+Completion.swift
//  UINavigationControllerNoNavbar
//
//  Created by Alex Tang on 11/12/16.
//  Copyright © 2016 Funkware. All rights reserved.
//

import UIKit
// Swift 3 version, no co-animation (alongsideTransition parameter is nil)
extension UINavigationController {
    public func pushViewController(
        _ viewController: UIViewController,
        animated: Bool,
        completion: @escaping (Void) -> Void)
    {
        pushViewController(viewController, animated: animated)

        guard animated, let coordinator = transitionCoordinator else {
            completion()
            return
        }

        coordinator.animate(alongsideTransition: nil) { _ in completion() }
    }
}

