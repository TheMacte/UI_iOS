//
//  NewsCell.swift
//  loginView
//
//  Created by DAN on 21.02.2020.
//  Copyright © 2020 DAN. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {
    
    @IBOutlet weak var groupImage: UIImageView!
    @IBOutlet weak var groupName: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var textField: UITextView!
    @IBOutlet weak var likeImage: UIImageView!
    @IBOutlet weak var likeCounter: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var shareButton: UIImageView!
    @IBOutlet weak var commentsButton: UIImageView!
    @IBOutlet weak var viewsImage: UIImageView!
    @IBOutlet weak var viewsCounter: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        

    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        groupImage.image = nil
        groupName.text = ""
        date.text = ""
        textField.text = ""
        likeImage.image = nil
        likeCounter.text = ""
        newsImage.image = nil
        shareButton.image = nil
        commentsButton.image = nil
        viewsImage.image = nil
        viewsCounter.text = ""
    }
}
