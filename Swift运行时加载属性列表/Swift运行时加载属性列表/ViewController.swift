//
//  ViewController.swift
//  Swift运行时加载属性列表
//
//  Created by James on 2017/5/24.
//  Copyright © 2017年 James. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Person.propertyListNew()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

