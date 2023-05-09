//
//  ViewController.swift
//  SocketDemo
//
//  Created by HPDOG on 2022/8/23.
//

import UIKit
import Starscream

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SocketHelper.shard.connectSocket()
    }
}

