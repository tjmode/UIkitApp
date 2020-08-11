//
//  PopUpViewController.swift
//  Twitter
//
//  Created by Dhayaalan Raju on 11/08/20.
//  Copyright © 2020 Dhayaalan Raju. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {
   let imageNameList = ["images-2", "images-3", "images-4","images-5","images-6","images-7","images-8"]
    var imageCount = 0

    @IBOutlet var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)

        // Do any additional setup after loading the view.
        imageView.image = UIImage(named: imageNameList[0])
        
    }
    
    @IBAction func closePopUp(_ sender: Any) {
        self.view.removeFromSuperview()
    }
    
    @IBAction func prevButton(_ sender: Any) {
        if imageCount != 0 {
            imageView.image = UIImage(named: imageNameList[imageCount - 1])
            imageCount = imageCount - 1
            
        }
    }
    
    @IBAction func nextButton(_ sender: Any) {
        if imageCount != imageNameList.count-1{
            imageView.image = UIImage(named: imageNameList[imageCount + 1])
            imageCount = imageCount + 1
            
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
