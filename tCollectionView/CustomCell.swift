//
//  CustomCell.swift
//  tCollectionView
//
//  Created by tyobigoro on 2020/06/18.
//  Copyright © 2020 tyobigoro. All rights reserved.
//

import UIKit

class CustomCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
    }
    
    func setImageName(_ imageName: String) {
        imageView.image = UIImage(named: imageName)
    }
    
}
