//
//  FirstViewController.swift
//  NavigationBar
//
//  Created by Deepak on 01/02/23.
//

import UIKit

class FirstViewController: UIViewController, NavigationBarViewDelegate {
    
    @IBOutlet weak var viewNavigation:NavigationBarView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNavigationBar()
    }
    
    private func setNavigationBar() {
        self.viewNavigation.navType = .other
        self.viewNavigation.commonInit()
        self.viewNavigation.lblTitle.text =  "First VC"
        self.viewNavigation.delegateBarAction = self
    }

    func navigationRightButtonAction() {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let SecondVC: SecondViewController = mainStoryboard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        self.navigationController?.pushViewController(SecondVC, animated: true)
    }
    
    func navigationBackAction() {
    }
}
