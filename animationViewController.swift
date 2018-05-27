//
//  animationViewController.swift
//  SIT206_Assignment2
//
//  Created by 王子璇 on 2018/5/19.
//  Copyright © 2018年 wangzixuan. All rights reserved.
//

import UIKit

class animationViewController: UIViewController {var gravity : UIGravityBehavior?
    var animator : UIDynamicAnimator?
    var gametimer : Timer?
    
    
    

override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    gametimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector:#selector(animationViewController.dropdown(_:)), userInfo: nil, repeats: true)
        animator = UIDynamicAnimator(referenceView: self.view)
        gravity = UIGravityBehavior(items: [])
        
        let vector = CGVector(dx: 0.0, dy: 0.1)
        gravity?.gravityDirection = vector
        animator?.addBehavior(gravity!)
    }
    
    @objc func dropdown(_ : Any){
        let xcoordinate = arc4random() % UInt32(self.view.bounds.width)
        
        let btn = UIButton(frame: CGRect(x: Int(xcoordinate), y: 60, width: 50, height: 50))
        btn.setImage(UIImage(named: "coines"), for: .normal)
        btn.addTarget(self, action: #selector(self.didimage(_:)), for: .touchUpInside)
        self.view.addSubview(btn)
        gravity?.addItem((btn as UIView))
    }
    
    @IBAction func didimage(_ sender: UIButton) {
        sender.setImage(UIImage(named: "coines"), for: .normal)
        UIView.animate(withDuration: 0.4, animations: {sender.alpha = 0}, completion: {(true) in sender.removeFromSuperview()})
        
    }
 
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
