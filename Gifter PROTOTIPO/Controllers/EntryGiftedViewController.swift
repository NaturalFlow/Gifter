//
//  EntryGiftedViewController.swift
//  Gifter PROTOTIPO
//
//  Created by LBrito on 3/1/19.
//  Copyright © 2019 L.Brito. All rights reserved.
//

import UIKit

class EntryGiftedViewController: UIViewController {
    
    @IBOutlet weak var giftedName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "mainMenu" {
            if let text = giftedName.text, text.isEmpty {
                return false
            }
        }
        return true
    }
}
