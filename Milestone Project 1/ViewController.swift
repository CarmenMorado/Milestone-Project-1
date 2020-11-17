//
//  ViewController.swift
//  Milestone Project 1
//
//  Created by Carmen Morado on 11/15/20.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet var ImageView: UIImageView!
    
    @IBAction func addBorder(_ sender: Any?) {
        ImageView.layer.borderColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0).cgColor
        ImageView.layer.masksToBounds = true
        ImageView.contentMode = .scaleToFill
        ImageView.layer.borderWidth = 3
    }
}

class ViewController: UITableViewController {
    let pictures = [UIImage(named: "spain@3x"), UIImage(named: "nigeria@3x"), UIImage(named: "italy@3x"), UIImage(named: "ireland@3x"), UIImage(named: "germany@3x"), UIImage(named: "poland@3x"), UIImage(named: "russia@3x"), UIImage(named: "estonia@3x"), UIImage(named: "uk@3x"), UIImage(named: "us@3x"), UIImage(named: "monaco@3x"), UIImage(named: "france@3x")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "World Flags"
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath) as! TableViewCell
        cell.addBorder(nil)
        cell.ImageView?.image = pictures[indexPath .row]
        return cell
    }
}




