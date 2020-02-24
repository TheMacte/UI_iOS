//
//  NewsCell.swift
//  loginView
//
//  Created by DAN on 21.02.2020.
//  Copyright © 2020 DAN. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {
    private var wasLiked: Bool = false
    private var counter = 0
    
    @IBOutlet weak var groupImage: UIImageView!
    @IBOutlet weak var groupName: UILabel!
    @IBOutlet weak var textField: UITextView!
    @IBOutlet weak var likeCounter: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var seenCount: UILabel!
    @IBOutlet weak var likeNewsView: LikeViewNews!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //Ловим нажате
        let tabGesture = UITapGestureRecognizer(target: self, action: #selector(onTap(_:)))
        likeNewsView.isUserInteractionEnabled = true
        likeNewsView.addGestureRecognizer(tabGesture)
    }
    
    
    @objc func onTap(_ sender: UIGestureRecognizer) {
        print(#function)
        
        if wasLiked == false {
            wasLiked = true
            counter += 1
            likeCounter.text = String(counter)
        } else {
            wasLiked = false
            counter -= 1
            likeCounter.text = String(counter)
        }
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
