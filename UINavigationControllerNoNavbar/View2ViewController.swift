//
//  View2ViewController.swift
//  UINavigationControllerNoNavbar
//
//  Created by Alex Tang on 11/12/16.
//  Copyright © 2016 Funkware. All rights reserved.
//

import UIKit

class View2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height + 100))
        backgroundView.backgroundColor = self.view.backgroundColor
        self.view.backgroundColor = UIColor.clear
        self.view.insertSubview(backgroundView, at: 0)
        backgroundView.layer.cornerRadius = 25
        backgroundView.clipsToBounds = true
        NSLog("view.frame: \(self.view.frame)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    deinit {
        NSLog("View 2 deinit")
    }

    @IBAction func goTo3Tapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "View3ViewController") as! View3ViewController
        self.navigationController!.pushViewController(vc, animated: true, completion: { () in
        })
    }
}
