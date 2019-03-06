//
//  ViewController.swift
//  Gifter PROTOTIPO
//
//  Created by LBrito on 2/22/19.
//  Copyright © 2019 L.Brito. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let productsImage = ["0","1","2","3","4","5"]
    let questionsTags = ["Age","♂️/ ♀️","👪","🎒","👘","👩🏻‍🎓","🏃🏻","🧸"]
    @IBOutlet weak var productCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout();
    }
    func setupLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10,left: 10,bottom: 10,right: 10)
        layout.minimumInteritemSpacing = 3
        layout.scrollDirection = .vertical
        productCollectionView.collectionViewLayout = layout
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            let cellWidth = (UIScreen.main.bounds.width-12-10-10)/4
            return CGSize(width: cellWidth, height: cellWidth - 10)
        }
        else if indexPath.section == 1 {
            let cellWidth = (UIScreen.main.bounds.width-9-10-10)/3
            return CGSize(width: cellWidth - 20 , height: 140)
        } else {
            let cellWidth = (UIScreen.main.bounds.width-6-10-10)/2
            return CGSize(width: cellWidth, height: 100)
        }
    }
}
extension ViewController : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        let numberItemsForSection = [0:questionsTags.count, 1:productsImage.count, 2:10, 3:10]
        return numberItemsForSection[section]!
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if indexPath.section == 0 {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "empty", for: indexPath)
            return header
        } else if indexPath.section == 1 {
           let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "sectionHeader", for: indexPath) as! SectionHeaderView
            header.sectionHeaderLabel.text = "Gift Sugestion"
            return header
        }else {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "sectionHeader", for: indexPath) as! SectionHeaderView
            header.sectionHeaderLabel.text = "Category Sugestion"
            return header
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize(width: 0, height: 0)
        }
        return CGSize(width: view.frame.width, height: 50)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "question", for: indexPath) as! QuestionCollectionViewCell
            cell.questionTag.text = questionsTags[indexPath.row]
            cell.contentView.layer.cornerRadius = 10
            cell.contentView.layer.borderWidth = 1
            cell.contentView.layer.borderColor = UIColor.clear.cgColor
            cell.contentView.layer.masksToBounds = true;
            
            
            return cell
        }
        if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "product", for: indexPath) as! ProductCollectionViewCell
            cell.productImage.image = UIImage(named: productsImage[indexPath.row]+".jpg")
            
            cell.contentView.layer.cornerRadius = 10
            cell.contentView.layer.borderWidth = 1
            cell.contentView.layer.borderColor = UIColor.clear.cgColor
            cell.contentView.layer.masksToBounds = true;
        
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "category", for: indexPath)
            cell.contentView.layer.cornerRadius = 10
            cell.contentView.layer.borderWidth = 1
            cell.contentView.layer.borderColor = UIColor.clear.cgColor
            cell.contentView.layer.masksToBounds = true;
            return cell
        }
    }
}
