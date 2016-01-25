//
//  MLTableViewCell.swift
//  MLSelfSizingCells
//
//  Created by Matthias Ludwig on 25.01.16.
//  Copyright © 2016 Matthias Ludwig. All rights reserved.
//

import UIKit

class MLTableViewCell: UITableViewCell {
    
    let sentenceLabel: UILabel
    let nameLabel: UILabel
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        sentenceLabel = UILabel()
        sentenceLabel.translatesAutoresizingMaskIntoConstraints = false
        sentenceLabel.numberOfLines = 0
        sentenceLabel.font = UIFont(name: "Menlo-Regular", size: 25.0)
        
        
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.numberOfLines = 0
        nameLabel.font = UIFont(name: "SanFranciscoDisplay-Light", size: 12.0)
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(sentenceLabel)
        contentView.addSubview(nameLabel)
        
        let views = [
            "sentenceLabel": sentenceLabel,
            "nameLabel": nameLabel
        ]
        
        NSLayoutConstraint.activateConstraints(NSLayoutConstraint.constraintsWithVisualFormat("|-8-[sentenceLabel]-8-|", options: [], metrics: nil, views: views))
        
        NSLayoutConstraint.activateConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-20-[sentenceLabel]-10-[nameLabel]-20-|", options: [.AlignAllLeading, .AlignAllTrailing], metrics: nil, views: views))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
}
