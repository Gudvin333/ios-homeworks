//
//  Photos.swift
//  Navigation
//
//  Created by Валентин Буров on 21.05.2022.
//

import UIKit

struct Photos {
    var image: UIImage
    
    static func makeModel() -> [Photos] {
        var model = [Photos]()
        model.append(Photos(image: UIImage(named: "photo1")!))
        model.append(Photos(image: UIImage(named: "photo2")!))
        model.append(Photos(image: UIImage(named: "photo3")!))
        model.append(Photos(image: UIImage(named: "photo4")!))
        model.append(Photos(image: UIImage(named: "photo5")!))
        model.append(Photos(image: UIImage(named: "photo6")!))
        model.append(Photos(image: UIImage(named: "photo7")!))
        model.append(Photos(image: UIImage(named: "photo8")!))
        model.append(Photos(image: UIImage(named: "photo9")!))
        model.append(Photos(image: UIImage(named: "photo10")!))
        model.append(Photos(image: UIImage(named: "photo11")!))
        model.append(Photos(image: UIImage(named: "photo12")!))
        model.append(Photos(image: UIImage(named: "photo13")!))
        model.append(Photos(image: UIImage(named: "photo14")!))
        model.append(Photos(image: UIImage(named: "photo15")!))
        model.append(Photos(image: UIImage(named: "photo16")!))
        model.append(Photos(image: UIImage(named: "photo17")!))
        model.append(Photos(image: UIImage(named: "photo18")!))
        model.append(Photos(image: UIImage(named: "photo19")!))
        model.append(Photos(image: UIImage(named: "photo20")!))
        return model
    }
}
