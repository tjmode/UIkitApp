//
//  ViewController.swift
//  Twitter
//
//  Created by Dhayaalan Raju on 07/08/20.
//  Copyright © 2020 Dhayaalan Raju. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //let imageArray = ["pic_1"]
    let imageArray = [ "images", "images-2", "images-3", "images-4", "images-5", "images-6", "images-7", "images-8"]
    let labelDescription = "hello sunitha"

    //let imageArray = ["pic_1", "pic_2", "pic_3"]
    //let imageArray = ["pic_1", "pic_2", "pic_3", "pic_4", "pic_5", "pic_6", "pic_7", "pic_8"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if labelDescription != "" {
            var label = UILabel(frame: CGRect(x: 100, y: 80, width: 250, height: 200
            ))
            label.numberOfLines = 5
            label.text = labelDescription
            self.view.addSubview(label)
        }
        
        if imageArray.count != 0 {
            imagePost()
        }
    }
    
    func imagePost(){
        if imageArray.count == 1 {
            let imageName = imageArray[0]
            let images = UIImage(named: imageName)
            let imageView = UIImageView(image: images!)
            imageView.frame = CGRect(x: 100, y: 100, width: 200, height: 200)
            view.addSubview(imageView)
        } else if imageArray.count == 2 {
            let imageName = imageArray[0]
            let images = UIImage(named: imageName)
            let imageView = UIImageView(image: images!)
            imageView.frame = CGRect(x: 100, y: 100, width: 100, height: 200)
            view.addSubview(imageView)

            let imageName2 = imageArray[1]
            let images2 = UIImage(named: imageName2)
            let imageView2 = UIImageView(image: images2!)
            imageView2.frame = CGRect(x: 200, y: 100, width: 100, height: 200)
            view.addSubview(imageView2)
            imageView2.isUserInteractionEnabled = true
            let tapRecogniser = UITapGestureRecognizer(target: self, action: Selector("imageTap:"))
            imageView2.addGestureRecognizer(tapRecogniser)
        } else if imageArray.count == 3 {
            let imageName = imageArray[0]
            let images = UIImage(named: imageName)
            let imageView = UIImageView(image: images!)
            imageView.frame = CGRect(x: 100, y: 100, width: 100, height: 200)
            view.addSubview(imageView)

            let imageName2 = imageArray[1]
            let images2 = UIImage(named: imageName2)
            let imageView2 = UIImageView(image: images2!)
            imageView2.frame = CGRect(x: 200, y: 100, width: 100, height: 100)
            view.addSubview(imageView2)
                   
            let imageName3 = imageArray[2]
            let images3 = UIImage(named: imageName3)
            let imageView3 = UIImageView(image: images3!)
            imageView3.frame = CGRect(x: 200, y: 200, width: 100, height: 100)
            view.addSubview(imageView3)
        } else {
            let imageName = imageArray[0]
            let images = UIImage(named: imageName)
            let imageView = UIImageView(image: images!)
            imageView.frame = CGRect(x: 100, y: 100, width: 100, height: 200)
            view.addSubview(imageView)

            let imageName2 = imageArray[1]
            let images2 = UIImage(named: imageName2)
            let imageView2 = UIImageView(image: images2!)
            imageView2.frame = CGRect(x: 200, y: 100, width: 100, height: 100)
            view.addSubview(imageView2)
                   
            let imageName3 = imageArray[2]
            let images3 = UIImage(named: imageName3)
            let imageView3 = UIImageView(image: images3!)
            imageView3.frame = CGRect(x: 200, y: 200, width: 100, height: 100)
            view.addSubview(imageView3)
                        
            let coverLayer = CALayer()
            coverLayer.frame = imageView3.bounds
            coverLayer.backgroundColor = UIColor.black.cgColor
            coverLayer.opacity = 0.7
            imageView3.layer.addSublayer(coverLayer)
            var label = UILabel(frame: CGRect(x: 225, y: 240, width: 200, height: 21))
            label.text = "+\(imageArray.count - 3)"
            label.textColor = UIColor.white
            label.font = label.font.withSize(30)
            
            self.view.addSubview(label)
        }
              
    }
    
    @IBAction func showPopUp(_ sender: Any) {
        
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "Popup") as! PopUpViewController
        self.addChild(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParent: self)
    }
    
}
