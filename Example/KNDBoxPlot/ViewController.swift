//
//  ViewController.swift
//  KNDBoxPlot
//
//  Created by roger.contreras.vl@gmail.com on 02/27/2019.
//  Copyright (c) 2019 roger.contreras.vl@gmail.com. All rights reserved.
//

import UIKit
import KNDBoxPlot

class ViewController: UIViewController {

    @IBOutlet weak var boxPlot: KNDBoxPlot!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    override func viewDidLayoutSubviews() {
//        boxPlot.setNeedsUpdateConstraints()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

