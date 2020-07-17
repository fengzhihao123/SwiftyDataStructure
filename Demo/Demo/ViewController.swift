//
//  ViewController.swift
//  Demo
//
//  Created by Phil.Feng on 2020/7/17.
//  Copyright © 2020 Phil.Feng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("begin - test")
        
        SingleLinkedListTest.test()
        DoubleLinkedListTest.test()
        CircularLinkedListTest.test()

        QueueTest.test()
        DequeTest.test()
        CircularQueueTest.test()
        
        print("end - test")
        
    }
}

