//
//  InfoViewController.swift
//  Navigation
//
//  Created by Валентин Буров on 24.04.2022.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        button()
    }

    private func button() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        button.center = view.center
        button.setTitle("Перейти", for: .normal)
        button.backgroundColor = .darkGray
        button.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc private func tapAction() {
        let allert = UIAlertController(title: "Вернуться назад", message: "Вы точно уверены, что хотите вернуться назад?", preferredStyle: .alert)
        let OK = UIAlertAction(title: "Ok", style: .default) { _ in
            self.dismiss(animated: true)
        }
        let cancel = UIAlertAction(title: "Отменить", style: .destructive)
        allert.addAction(cancel)
        allert.addAction(OK)
        present(allert, animated: true)
    }
}
