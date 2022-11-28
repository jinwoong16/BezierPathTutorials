//
//  ViewController.swift
//  BezierPathTutorials
//
//  Created by jinwoong Kim on 2022/11/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let someview = MessageBubbleLabel()
        view.addSubview(someview)
        
        someview.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
//            someview.topAnchor.constraint(equalTo: view.topAnchor)
//            someview.trailingAnchor.constraint(equalTo: view.trailingAnchor)
//            someview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            someview
            someview.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            someview.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }


}

