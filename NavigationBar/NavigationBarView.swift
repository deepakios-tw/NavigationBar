//
//  NavigationBarView.swift
//  NavigationBar
//
//  Created by Deepak on 01/02/23.
//

import UIKit
@objc protocol NavigationBarViewDelegate: AnyObject {
    @objc optional func navigationBackAction()
    @objc optional func navigationRightButtonAction()
}
enum navRightViewType{
    case profie
    case other
}

class NavigationBarView: UIView {
    @IBOutlet var btnBack: UIButton!
    @IBOutlet var btnRightBar: UIButton!
    
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var viewContent: UIView!
    
    let XIB_NAME = "NavigationBarView"
    var navType:navRightViewType = .other
    var delegateBarAction:NavigationBarViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed(XIB_NAME, owner: self, options: nil)
        viewContent.fixInView(self)
        [btnBack, btnRightBar].forEach {
            $0?.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        }
        btnBack.showsTouchWhenHighlighted = false
        switch navType {
        case .profie:
            btnRightBar.isHidden = true
        case .other:
            btnBack.isHidden = true
            btnRightBar.isHidden = false
        }
    }
}

extension NavigationBarView {
    @objc func buttonPressed(_ sender: UIButton) {
        switch sender {
        case btnBack:
            self.backClick()
        case btnRightBar:
            self.rightButtonClick()
        default:
            break
        }
    }
    
    private func backClick() {
        delegateBarAction?.navigationBackAction?()
    }
    
    private func rightButtonClick() {
        delegateBarAction?.navigationRightButtonAction?()
    }
}
extension UIView {
    func fixInView(_ container: UIView!) -> Void{
        self.translatesAutoresizingMaskIntoConstraints = false;
        self.frame = container.frame;
        container.addSubview(self);
        NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: container, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: container, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: container, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: container, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
    }
}






