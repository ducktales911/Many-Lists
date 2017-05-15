//
//  DetailViewController.swift
//  ThomasHamburger-pset5
//
//  Created by Thomas Hamburger on 11-05-17.
//  Copyright © 2017 Thomas Hamburger. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var detailDescriptionLabel: UILabel!
    
    @IBOutlet weak var todosTableView: UITableView!


    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if let label = detailDescriptionLabel {
                label.text = detail.description
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addButton(_ sender: Any) {
    }
    

    var detailItem: NSDate? {
        didSet {
            // Update the view.
            configureView()
        }
    }


}

