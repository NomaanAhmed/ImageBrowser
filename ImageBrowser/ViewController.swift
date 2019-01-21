//
//  ViewController.swift
//  ImageBrowser
//
//  Created by Nomaan Ahmed on 2018-08-28.
//  Copyright © 2018 Nomaan Ahmed. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Simple Image Viewer"
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        navigationController?.navigationBar.prefersLargeTitles = true

        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
    print(pictures)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 1: try loading the "Detail" view controller and typecasting it to be DetailViewController
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            // 2: success! Set its selectedImage property
            vc.selectedImage = pictures[indexPath.row]
            
            // 3: now push it onto the navigation controller
            navigationController?.pushViewController(vc, animated: true)
        }
    }

}

