//
//  DetailViewController.swift
//  Milestone Project 1
//
//  Created by Carmen Morado on 11/18/20.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var flagView: UIImageView!
    var selectedImage: UIImage?
    var imageName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let imageToLoad = selectedImage {
            flagView.image = imageToLoad
            addBorder(nil)
        }
        
        let names = ["spain@3x", "nigeria@3x", "italy@3x", "ireland@3x", "germany@3x","poland@3x", "russia@3x", "estonia@3x", "uk@3x", "us@3x", "monaco@3x", "france@3x"]
        
        for name in names {
            if flagView.image == UIImage(named: name) {
                imageName = name
            }
        }
        
        if imageName!.count == 5 {
            title = "\(imageName!.uppercased().dropLast(3))"
            imageName = "\(imageName!.uppercased().dropLast(3))"
        }
        
        else {
            title = "\(imageName!.capitalized.dropLast(3))"
            imageName = "\(imageName!.capitalized.dropLast(3))"
        }
        
        navigationItem.largeTitleDisplayMode = .never
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
    }
    
    @IBAction func addBorder(_ sender: Any?) {
        flagView.layer.borderColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0).cgColor
        flagView.layer.masksToBounds = true
        flagView.contentMode = .scaleToFill
        flagView.layer.borderWidth = 3
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    @objc func shareTapped() {
        guard let image = flagView.image?.jpegData(compressionQuality: 0.8) else {
            print("No image found")
            return
        }

        let vc = UIActivityViewController(activityItems: [image, imageName!], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
        
    }

}
