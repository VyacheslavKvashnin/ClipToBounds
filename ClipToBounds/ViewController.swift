//
//  ViewController.swift
//  ClipToBounds
//
//  Created by Вячеслав Квашнин on 31.07.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let view1: UIControl = {
       let view = UIControl()
        view.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        view.backgroundColor = .red
        view.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        return view
    }()
    
    let view2: UIControl = {
       let view = UIControl()
        view.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        view.backgroundColor = .blue
        view.addTarget(self, action: #selector(tapButton2), for: .touchUpInside)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        
        view.addSubview(view1)
        view1.frame.origin = CGPoint(x: 100, y: 100)
        view2.frame.origin = CGPoint(x: 150, y: 150)
        view.addSubview(view2)
        
    }
    
    @objc func tapButton() {
        print("Tap 1")
    }
    @objc func tapButton2() {
        print("Tap 2")
    }
}


extension UIControl {
    open override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let expendedBounds = self.bounds.insetBy(dx: -50, dy: -50)
        return expendedBounds.contains(point)
    }
}
