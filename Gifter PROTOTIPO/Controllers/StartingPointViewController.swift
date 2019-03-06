//
//  StartingPointViewController.swift
//  Gifter PROTOTIPO
//
//  Created by LBrito on 3/1/19.
//  Copyright © 2019 L.Brito. All rights reserved.
//

import UIKit

class StartingPointViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
extension StartingPointViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "gifted", for: indexPath)
        cell.contentView.layer.cornerRadius = 10
        cell.contentView.layer.borderWidth = 1
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = true;
        return cell
    }
}
