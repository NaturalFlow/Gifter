//
//  QuestionPopUpViewController.swift
//  Gifter PROTOTIPO
//
//  Created by LBrito on 2/26/19.
//  Copyright © 2019 L.Brito. All rights reserved.
//

import UIKit

class QuestionPopUpViewController: UIViewController {
    
    @IBOutlet weak var popUpView: UIView!
    @IBAction func closePopUp(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popUpView.layer.cornerRadius = 10
        popUpView.layer.masksToBounds = true
        popUpView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.601375214)
        popUpView.layer.borderWidth = 2
    }

}
extension QuestionPopUpViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "option", for: indexPath)
        return cell
    }
    
    
}
