//
//  RobotDetailView.swift
//  AppBundleReader
//
//  Created by djchai on 1/16/18.
//  Copyright © 2018 Eliel Gordon. All rights reserved.
//

import WebKit
import UIKit

class RobotDetailView: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var personalityLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var robotImage: WKWebView!
    
    var robot: Robot?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
        robotImage.layer.borderColor = UIColor.white.cgColor
        robotImage.layer.borderWidth = 2
        nameLabel.text = robot?.name
        personalityLabel.text = robot?.personality
        commentLabel.text = robot?.phrase
        guard let image = robot?.image else {return}
        let request = URLRequest(url: (image))
        robotImage.load(request)
    }

}
