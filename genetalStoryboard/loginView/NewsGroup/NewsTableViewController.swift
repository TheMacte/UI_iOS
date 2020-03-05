//ß
//  NewsTableViewController.swift
//  loginView
//
//  Created by DAN on 21.02.2020.
//  Copyright © 2020 DAN. All rights reserved.
//
var newsBase = [
    News(auther: "Boris", autherAvatar: UIImage(imageLiteralResourceName: "Boris"), newsImage: UIImage(imageLiteralResourceName: "Boris"), newsText: "О происхождении и значении имени существуют несколько мнений. Имя обычно связывается[2][3] с первым носителем имени болгарским ханом[4] Богорисом (Борисом I) (др.-греч. Βογορις, Βωγωρις, Βορισης), крестителем Болгарии. Борис I в крещении получил имя Михаил и титул князя. ", likesCounter: 77, seenCounter: 100),
    News(auther: "Clara", autherAvatar: UIImage(imageLiteralResourceName: "Clara"), newsImage: UIImage(imageLiteralResourceName: "Clara"), newsText: "Клара — женское личное имя. Происходит от латинского слова clara, означающего «светлая»", likesCounter: 15, seenCounter: 30),
    News(auther: "Dmitriy", autherAvatar: UIImage(imageLiteralResourceName: "Dmitriy"), newsImage: UIImage(imageLiteralResourceName: "Dmitriy"), newsText: "Дми́трий (см. также Деметрий) — распространённое мужское имя греческого происхождения. Происхождение имени связано с именем древнегреческой богини земли и плодородия Деметры. Значение имени — «посвящённый богине Деметре» (Митре). Церковнославянская форма — Димитрий, древнерусские — Дьмитр(ии), Дъмитръ (откуда уменьшительное Дъмъка, Домка). Уменьшительное (с XIII—XIV веков) — Митя, в XX веке потеснено новым (образованным от церковнославянской формы) Дима. ", likesCounter: 9, seenCounter: 12)
]

import UIKit

class NewsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsBase.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as? NewsCell else {
            preconditionFailure("Can't deque NewsCell")
            
        }
        cell.groupImage.image = newsBase[indexPath.row].autherAvatar
        cell.groupName.text = newsBase[indexPath.row].auther
        cell.textField.text = newsBase[indexPath.row].newsText
        cell.newsImage.image = newsBase[indexPath.row].newsImage
        cell.likeCounter.text = String(newsBase[indexPath.row].likesCounter)
        cell.seenCount.text = String(newsBase[indexPath.row].seenCounter)
        cell.textField.translatesAutoresizingMaskIntoConstraints = true
        cell.textField.sizeToFit()
        
        return cell
    }
    
}
