//
//  NYTimesTableViewCell.swift
//  NYTimes
//
//  Created by Mubeena K A on 25/11/2019.
//  Copyright © 2019 Nafees. All rights reserved.
//

import UIKit
import Kingfisher

class NYTimesTableViewCell: UITableViewCell {
    @IBOutlet weak var newsIconImage: UIImageView!
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsAuthorLabel: UILabel!
    @IBOutlet weak var newsDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.newsIconImage.layer.cornerRadius = self.newsIconImage.frame.size.width / 2
        self.newsIconImage.layer.masksToBounds = true
        
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateCellResult(news: News?) {
        if let newsFeed = news {
            self.newsTitleLabel.text = newsFeed.title
            self.newsAuthorLabel.text = newsFeed.byline
            self.newsDateLabel.text = newsFeed.published_date
            if let url = news?.imageUrl {
                self.newsIconImage.kf.setImage(with: URL(string: url))
            }
        }
    }

}
