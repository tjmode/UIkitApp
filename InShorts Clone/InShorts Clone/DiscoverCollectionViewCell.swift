//
//  DiscoverCollectionViewCell.swift
//  InShorts Clone
//
//  Created by Sunitha Balasubramanian on 29/08/20.
//  Copyright © 2020 Sunitha Balasubramanian. All rights reserved.
//

import UIKit

class DiscoverCollectionViewCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    @IBOutlet weak var HeaderCollectionview: UICollectionView!
    
    @IBOutlet weak var bodyCollectionView: UICollectionView!
    func setup(){
        HeaderCollectionview.delegate = self
        HeaderCollectionview.dataSource = self
        bodyCollectionView.delegate = self
        bodyCollectionView.dataSource = self
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == HeaderCollectionview {
            return 2
        }
        else if collectionView == bodyCollectionView {
            return 6
        }
        return section
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == HeaderCollectionview {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: "HeaderCell", for: indexPath) as! HeaderCollectionViewCell
        return item
        }
        else if collectionView == bodyCollectionView {
            let item = collectionView.dequeueReusableCell(withReuseIdentifier: "BodyCell", for: indexPath) as! BodyCollectionViewCell
            return item
            
        }
        return UICollectionViewCell()
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         if collectionView == HeaderCollectionview {
            return CGSize(width: 250, height: 150)
        }
        else if collectionView == bodyCollectionView {
            return CGSize(width: 96, height: 128)
        }
        return CGSize(width: 0, height: 0)
    }
    
  
}
