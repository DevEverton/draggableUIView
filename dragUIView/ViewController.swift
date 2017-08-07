//
//  ViewController.swift
//  dragUIView
//
//  Created by Everton Carneiro on 20/07/17.
//  Copyright © 2017 Everton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myView: UIView!
   
    var location = CGPoint(x: 0, y: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        myView.isUserInteractionEnabled = true
        
        let touch: UITouch! = touches.first! as UITouch
        
        if touch.view == myView {
            
            location = touch.location(in: self.view)
            myView.center = location
        }
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        myView.isUserInteractionEnabled = true
        
        let touch: UITouch! = touches.first! as UITouch
        
        if touch.view == myView {
            location = touch.location(in: self.view)
            myView.center = location
            
        }
        
        if myView.center.y > view.bounds.size.height - 50 {
            myView.frame = CGRect(x: myView.center.x - 25, y: view.bounds.size.height - 50, width: myView.frame.size.width, height: myView.frame.size.height)
            
            
        }else if myView.center.y < 50 {
            
            myView.frame = CGRect(x: myView.center.x - 25, y: 0, width: myView.frame.size.width, height: myView.frame.size.height)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let yButton = myView.center.y - 25
        let xButton = view.bounds.size.width - 50
        
        
        if myView.center.x < view.center.x {
            UIView.animate(withDuration: 0.3, animations: {
                self.myView.frame = CGRect(x: 0, y: yButton, width: self.myView.frame.size.width, height: self.myView.frame.size.height)})
        }else{
            UIView.animate(withDuration: 0.3, animations: {
                self.myView.frame = CGRect(x: xButton, y: yButton, width: self.myView.frame.size.width, height: self.myView.frame.size.height)})
        }
    }
}

