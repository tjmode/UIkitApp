//
//  PopOverViewController.swift
//  Twitter
//
//  Created by Sunitha Balasubramanian on 12/08/20.
//  Copyright © 2020 Sunitha Balasubramanian. All rights reserved.
//

import UIKit

class PopOverViewController: UIViewController {
    
    let imageNameList = [""]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func closePopUp(_ sender: Any) {
        self.view.removeFromSuperview()
        
    }
    
    
    @IBAction func next(_ sender: Any) {
    }
    
    
    @IBAction func prev(_ sender: Any) {
    }
    

}
