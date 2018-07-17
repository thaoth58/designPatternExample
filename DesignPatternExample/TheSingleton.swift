//
//  TheSingleton.swift
//  DesignPatternExample
//
//  Created by Thao Truong on 7/17/18.
//  Copyright © 2018 GEM. All rights reserved.
//

import UIKit

class TheSingleton: NSObject {
    static let shared = TheSingleton()
    
    private override init() {}
    
    var content: String?
    
    func replaceText(text: String?) {
        content = text
    }
}
