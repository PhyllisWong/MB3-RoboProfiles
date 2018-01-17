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
    
    var robots = [Robot]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view, typically from a nib.
        let path = Bundle.main.path(forResource: "robo-profiles", ofType: ".json")
        if let path = path {
            let url = URL(fileURLWithPath: path)
            let contents = try? Data(contentsOf: url, options: .alwaysMapped)
            let robots = try? JSONDecoder().decode([Robot].self, from: contents!)
            // print(robots!)
            guard let Robots = robots else {return}
            self.robots = Robots
        }
    }
}

extension RobotListVC: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.robots.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let robot = self.robots[row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "robotCell", for: indexPath)
        cell.textLabel?.text = robot.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        let robot = self.robots[row]
        let robotDetailVC = storyboard?.instantiateViewController(withIdentifier: "RobotDetailView") as! RobotDetailView
        robotDetailVC.robot = robot
        self.navigationController?.pushViewController(robotDetailVC, animated: true)
    }
}






