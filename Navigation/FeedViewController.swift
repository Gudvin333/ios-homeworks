//
//  FeedViewController.swift
//  Navigation
//
//  Created by Валентин Буров on 24.04.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    var post: Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        button()
    }
    private func button() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        button.center = view.center
        button.setTitle("Перейти", for: .normal)
        button.backgroundColor = .gray
        button.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc private func tapAction() {
        let postVC = PostViewController()
        postVC.title = post?.title
        navigationController?.pushViewController(postVC, animated: true)
    }
}
