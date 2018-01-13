//
//  ViewController.swift
//  AppBundleReader
//
//  Created by Eliel A. Gordon on 10/26/17.
//  Copyright © 2017 Eliel Gordon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let path = Bundle.main.path(forResource: "robo-profiles", ofType: ".json") {
            
            let urlPath = URL(fileURLWithPath: path)
            print(urlPath)
            
            // converts the path to data
            guard let data = try? Data(contentsOf: urlPath, options: .alwaysMapped) else {
                return 
            }
            
            let decoder = JSONDecoder()
            let model = try? decoder.decode([RoboProfile].self, from: data)
            print(model)
        }
    }
}

