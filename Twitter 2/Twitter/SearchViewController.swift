//
//  SearchViewController.swift
//  Twitter
//
//  Created by Sunitha Balasubramanian on 11/08/20.
//  Copyright © 2020 Sunitha Balasubramanian. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var searchTableView: UITableView!

    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var profileImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        if let textField = searchBar.value(forKey: "searchField") as? UITextField {
//            textField.borderStyle = .roundedRect
//            if let backgroundView = textField.subviews.first {
//                backgroundView.layer.cornerRadius = 40
//                backgroundView.clipsToBounds = true
//            }
//        }
//        searchBar.layer.cornerRadius = searchBar.frame.height
//        searchBar.clipsToBounds = true
        // Do any additional setup after loading the view.
        searchTableView.dataSource = self
        searchTableView.delegate = self
        profileImageConstriants()
    }
    func profileImageConstriants(){
       profileImage.layer.borderWidth = 0.1
       profileImage.layer.masksToBounds = false
       profileImage.layer.cornerRadius = profileImage.frame.size.width / 2
       profileImage.layer.cornerRadius = profileImage.frame.size.height / 2
       profileImage.clipsToBounds = true
       profileImage.layer.borderColor = UIColor.black.cgColor
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as! SearchTableViewCell
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 73
    }
    
}
