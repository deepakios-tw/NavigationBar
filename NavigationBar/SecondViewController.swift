//
//  SecondViewController.swift
//  NavigationBar
//
//  Created by Deepak on 01/02/23.
//

import UIKit

class SecondViewController: UIViewController, NavigationBarViewDelegate {

    @IBOutlet weak var viewNavigation:NavigationBarView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNavigationBar()
    }
    
    private func setNavigationBar() {
        self.viewNavigation.navType = .profie
        self.viewNavigation.commonInit()
        self.viewNavigation.lblTitle.text =  "Second VC"
        self.viewNavigation.delegateBarAction = self
    }
    
    func navigationBackAction() {
        self.navigationController?.popViewController(animated: true)
    }
}
