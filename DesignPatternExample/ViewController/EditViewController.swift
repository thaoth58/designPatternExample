//
//  EditViewController.swift
//  DesignPatternExample
//
//  Created by Thao Truong on 7/17/18.
//  Copyright © 2018 GEM. All rights reserved.
//

import UIKit

protocol EditVCDelegate: class {
    func didUpdateText(text: String?)
}

class EditViewController: UIViewController {
    @IBOutlet weak var contentTf: UITextField!
    
    weak var delegate: EditVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Action
    @IBAction func updateBySingletonAction(_ sender: Any) {
        TheSingleton.shared.replaceText(text: contentTf.text)
    }

    @IBAction func updateByDelegateAction(_ sender: Any) {
        delegate?.didUpdateText(text: contentTf.text)
        
        //Only by using delegate, you will know exactly what is received view controller
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func updateByNotificationCenterAction(_ sender: Any) {
        //Only pass userInfo if text is not nil
        var userInfo = [String: String]()
        if let text = contentTf.text {
            userInfo["text"] = text
        }
        NotificationCenter.default.post(name: .updateText, object: nil, userInfo: userInfo)
    }
}
