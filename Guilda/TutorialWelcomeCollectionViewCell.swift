//
//  FaqTutorialWelcomeCollectionViewCell.swift
//  Guilda
//
//  Created by rodolfo silva on 25/08/22.
//

import UIKit

class TutorialWelcomeCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Overrides
    @IBOutlet weak var titleLabel: UILabel!
    {
        didSet {
            titleLabel.font = UIFont.systemFont(ofSize: 28)
        }
    }
    
    @IBOutlet weak var contentLabel: UILabel!
    {
        didSet {
            contentLabel.font = UIFont.systemFont(ofSize: 14)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
