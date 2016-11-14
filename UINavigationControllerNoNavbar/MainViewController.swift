//
//  MainViewController.swift
//  UINavigationControllerNoNavbar
//
//  Created by Alex Tang on 11/12/16.
//  Copyright © 2016 Funkware. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func goTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let navViewController = storyboard.instantiateViewController(withIdentifier: "TopNav") as! UINavigationController
        let view3ViewController = storyboard.instantiateViewController(withIdentifier: "View3ViewController") as! View3ViewController
        navViewController.pushViewController(view3ViewController, animated: false)
        navViewController.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        self.present(navViewController, animated: true, completion: nil)

    }
}
