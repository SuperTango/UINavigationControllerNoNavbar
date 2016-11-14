//
//  JamNavigationControllerDelegate.swift
//  Playlist
//
//  Created by Alex Tang on 11/12/16.
//  Copyright © 2016 Funkware. All rights reserved.
//

import UIKit

class JamNavigationControllerDelegate: NSObject, UINavigationControllerDelegate, UIViewControllerAnimatedTransitioning {

    func navigationController(_ navigationController: UINavigationController,
                              animationControllerFor operation: UINavigationControllerOperation,
                              from fromVC: UIViewController,
                              to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }

    func transitionDuration(using context: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.2
    }

    func animateTransition(using context: UIViewControllerContextTransitioning) {
        guard let toVC = context.viewController(forKey: UITransitionContextViewControllerKey.to) else {
            return
        }
        guard let fromVC = context.viewController(forKey: UITransitionContextViewControllerKey.from) else {
            return
        }
        context.containerView.addSubview(fromVC.view)
        context.containerView.addSubview(toVC.view)
        if (toVC.isKind(of: View2ViewController.self)) {
            let originalCenter = toVC.view.center
            toVC.view.center = CGPoint(x: toVC.view.center.x, y: toVC.view.center.y + UIScreen.main.bounds.height)
            UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: UIViewAnimationOptions.curveEaseInOut, animations: {
                toVC.view.center = originalCenter
            }, completion: { (completed: Bool) in
                context.completeTransition(!context.transitionWasCancelled)
            })
        } else {
            // animate your views here, then call this method when your animation is completed:
            fromVC.view.alpha = 1
            toVC.view.alpha = 0
            let duration = self.transitionDuration(using: context)
            UIView.animate(withDuration: duration, delay: 0, options: UIViewAnimationOptions.curveLinear, animations: {
                toVC.view.alpha = 1
            }, completion: { (completed: Bool) in
                context.completeTransition(!context.transitionWasCancelled)
            })
        }
    }

    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        viewController.viewDidAppear(animated)
    }

    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        viewController.viewWillAppear(animated)
    }
}
