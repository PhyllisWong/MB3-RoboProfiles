//
//  ViewController.swift
//  AppBundleReader
//
//  Created by Eliel A. Gordon on 10/26/17.
//  Copyright © 2017 Eliel Gordon. All rights reserved.
//

import UIKit
import WebKit


class RobotListVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var images: [Image] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Robo Profile Challenge"
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.rowHeight = 150
        let converter = try? convertUrlToData()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func createArray() -> [Image] {
        
        var imagesArray = [Image]()
        return imagesArray
    }
    
    func convertUrlToData() throws -> [RoboProfile] {
        // Do any additional setup after loading the view, typically from a nib.
        
        if let path = Bundle.main.path(forResource: "robo-profiles", ofType: ".json") {
            
            let urlPath = URL(fileURLWithPath: path)
            print(urlPath)
            
            // converts the path to data
            guard let data = try? Data(contentsOf: urlPath, options: .alwaysMapped) else {
                throw RoboError.missingData
            }
            let decoder = JSONDecoder()
            
            guard let model = try? decoder.decode([RoboProfile].self, from: data) else {
                
                throw RoboError.failedConvertingData
            }
            print(model)
            return model
        } else {
            throw RoboError.noPath
        }
    }
    
    
}

extension RoboImageVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let image = images[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "roboCell") as! RoboCell
        cell.setImage(image: image)
        
        return cell
    }
    
    
}





