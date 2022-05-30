//
//  PostPreview.swift
//  Navigation
//
//  Created by Валентин Буров on 08.05.2022.
//

import UIKit

struct PostPreview {
    var author: String
    var image: UIImage
    var description: String?
    var likes: Int
    var isLiked: Bool = false
    var views: Int
    
    static func makeModel() -> [PostPreview] {
        var model = [PostPreview]()
        model.append(PostPreview(author: "Бильбо Бэгинс", image: UIImage(named: "lotr1")!, description: "Волшебный водопад", likes: 38, views: 67))
        model.append(PostPreview(author: "Бильбо Бэгинс", image: UIImage(named: "lotr2")!, description: "Отлично провел время у эльфов", likes: 48, views: 72))
        model.append(PostPreview(author: "Бильбо Бэгинс", image: UIImage(named: "lotr3")!, description: "Как же соскучился по дому", likes: 108, views: 206))
        model.append(PostPreview(author: "Бильбо Бэгинс", image: UIImage(named: "lotr4")!, description: "Наконец-то веррнулся", likes: 148, views: 233))
        
        return model
    }
}
