//
//  ViewController.swift
//  Milestone Project 1
//
//  Created by Carmen Morado on 11/15/20.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet var ImageView: UIImageView!
}

class ViewController: UITableViewController {
    //let flags = [("Laravel"),("Swift"),("Apple"),("Window"),("Android")]
    //let flags = [UIImage(named: "Laravel"), UIImage(named: "swift"), UIImage(named: "Laravel"), UIImage(named: "window"), UIImage(named: "Android")]
    //var pictures = [String]()
    //var pictures: [UIImage] = [spain@2x.png];
    
    let pictures = [UIImage(named: "spain@3x")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath) as! TableViewCell
        cell.ImageView?.image = pictures[indexPath .row]
        return cell
    }
        // Do any additional setup after loading the view.
}




