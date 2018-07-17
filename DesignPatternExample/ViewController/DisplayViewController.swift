//
//  DisplayViewController.swift
//  DesignPatternExample
//
//  Created by Thao Truong on 7/17/18.
//  Copyright © 2018 GEM. All rights reserved.
//

import UIKit

class DisplayViewController: UIViewController {
    @IBOutlet weak var singletonContentLabel: UILabel!
    @IBOutlet weak var delegateContentLabel: UILabel!
    @IBOutlet weak var notificationCenterContentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(didReceiveNotification(notification:)), name: .updateText, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Action
    @IBAction func updateTextAction(_ sender: Any) {
        //Singleton will not send you an event when its value is updated
        singletonContentLabel.text = TheSingleton.shared.content
    }
    
    @objc func didReceiveNotification(notification: Notification) {
        if let userInfo = notification.userInfo, let text = userInfo["text"] as? String {
            notificationCenterContentLabel.text = text
        }
    }
    
    @IBAction func goToFirstVCAction(_ sender: Any) {
        if let editVC = self.storyboard?.instantiateViewController(withIdentifier: "EditViewController") as? EditViewController {
            editVC.delegate = self
            self.navigationController?.pushViewController(editVC, animated: true)
        }
    }
}

extension DisplayViewController: EditVCDelegate {
    func didUpdateText(text: String?) {
        delegateContentLabel.text = text
    }
}
