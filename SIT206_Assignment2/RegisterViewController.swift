//
//  RegisterViewController.swift
//  SIT206_Assignment2
//
//  Created by 王子璇 on 2018/5/10.
//  Copyright © 2018年 wangyuwei. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var Usersdob: UIDatePicker!
    @IBOutlet weak var Username: UITextField!
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var Tel: UITextField!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func submit(_ sender: UIButton) {
        Registers.addRegister(username: Username.text, password: <#T##String#>, usersdob: <#T##Date#>, email: <#T##String#>, tel: <#T##Int32#>)
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
