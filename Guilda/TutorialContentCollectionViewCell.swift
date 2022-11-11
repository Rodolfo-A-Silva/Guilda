//
//  FaqTutorialContentCollectionViewCell.swift
//  Guilda
//
//  Created by rodolfo silva on 25/08/22.
//

import UIKit

class TutorialContentCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var cellImage: UIImageView!
    
    @IBOutlet weak var contentText: UILabel! {
        didSet {
            self.contentText.font = UIFont.systemFont(ofSize: 14)
            self.contentText.textColor = .black
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
