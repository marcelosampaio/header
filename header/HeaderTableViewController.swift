//
//  HeaderTableViewController.swift
//  header
//
//  Created by Marcelo on 7/6/17.
//  Copyright © 2017 MAS. All rights reserved.
//

import UIKit

class HeaderTableViewController: UITableViewController {

    // MARK: - Properties
    var source = [String]()
    
    // MARK: - Outlets
    
    @IBOutlet var headerView: UIView!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var headerImageView: UIImageView!
    

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // load application data
        loadSource()
        
        if source.count == 0 {
            // setup header
            setNoContent(msg: "Welcome!")
        }
        
        
    }

    // MARK: - Application Data Source
    private func loadSource(){
        
        for i in 0..<10 {
            source.append(String(describing: i))
        }

    }
    
    

    // MARK: - Table View Delegate
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return source.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.textLabel?.text = source[indexPath.row]
        cell.imageView?.image = UIImage.init(named: "image1")

        return cell
    }
 
    // MARK: - TableView Helper
    private func setNoContent(msg: String) {
        self.headerLabel.text = msg
        self.headerView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.bounds.size.height)
        self.tableView.tableHeaderView = self.headerView
    }
    

}
