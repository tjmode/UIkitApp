//
//  TweetViewController.swift
//  Twitter
//
//  Created by Sunitha Balasubramanian on 11/08/20.
//  Copyright © 2020 Sunitha Balasubramanian. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
   // var imageArray = [String]()
    
    var tweetTextArray = ["HELLLOOOO"]
    var userName = [String]()
    var imageArray = [[String]]()
    var comments = [[String]]()
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Tweet"
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
//        self.navigationController?.navigationItem.leftBarButtonItem = nil
//        self.navigationItem.hidesBackButton = false
        //print("\(userName) hwlkpof j")
        //print(userId)
        
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tweetCell") as! TweetTableViewCell
        cell.profileImage.layer.borderWidth = 0.1
        cell.profileImage.layer.masksToBounds = false
        cell.profileImage.layer.cornerRadius = cell.profileImage.frame.size.width / 2
        cell.profileImage.layer.cornerRadius = cell.profileImage.frame.size.height / 2
        cell.profileImage.clipsToBounds = true
        cell.profileImage.layer.borderColor = UIColor.black.cgColor
        cell.userName.text = userName[0]
        cell.userID.text = userName[1]
        cell.profileImage.image = UIImage(named:userName[2])
        

        
        //Hidding part
        if imageArray[0].count == 0 {
            cell.profileView.isHidden = true
            let marginTop = NSLayoutConstraint(item: cell.timeView, attribute: .top, relatedBy: .equal, toItem: cell.profileView, attribute: .top, multiplier: 1.0, constant: 30)
            let marginRight = NSLayoutConstraint(item: cell.timeView    , attribute: .right, relatedBy: .equal, toItem: cell.tweetText, attribute: .right, multiplier: 1.0, constant: -20)
            NSLayoutConstraint.activate([marginTop, marginRight])
        } else {
            cell.profileView.isHidden = false
            let imageName = imageArray[0]
            let images = UIImage(named: imageName[0])
            let imageView = UIImageView(image: images!)
            cell.profileView.contentMode = .scaleToFill
            cell.profileView.addSubview(imageView)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                  imageView.widthAnchor.constraint(equalTo: cell.profileView.widthAnchor, multiplier: 1.0),
                  imageView.heightAnchor.constraint(equalTo: cell.profileView.heightAnchor)
            ])

        }
        
        if imageArray[1][0] == "" {
            cell.tweetText.isHidden = true
            
            let marginTop = NSLayoutConstraint(item: cell.profileView , attribute: .top, relatedBy: .equal, toItem: cell.userID, attribute: .top, multiplier: 1.0, constant: 30)
            NSLayoutConstraint.activate([marginTop])
           
        } else {
            cell.tweetText.isHidden = false
            cell.tweetText.text = imageArray[1][0]
        }
        
        if imageArray.count != 0 && imageArray[1][0] !=  "" {
            cell.profileView.isHidden = false
            cell.tweetText.isHidden = false
        }

        return cell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 500
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentTweetCell",for: indexPath) as! TweetTableViewCell
            cell.commentProfileImage.layer.borderWidth = 0.1
            cell.commentProfileImage.layer.masksToBounds = false
            cell.commentProfileImage.layer.cornerRadius = cell.commentProfileImage.frame.size.width / 2
            cell.commentProfileImage.layer.cornerRadius = cell.commentProfileImage.frame.size.height / 2
            cell.commentProfileImage.clipsToBounds = true
            cell.commentProfileImage.layer.borderColor = UIColor.black.cgColor
               
            cell.commentUserNameLabel.text = comments[2][0]
            cell.commentUserIdLabel.text = "@\(comments[2][0])"
            cell.commentProfileImage.image = UIImage(named:comments[2][0])
               

               
               //Hidding part
               if comments[1].count == 0 {
                   cell.commentProfileView.isHidden = true
                   let marginTop = NSLayoutConstraint(item: cell.commentTimeLabel, attribute: .top, relatedBy: .equal, toItem: cell.commentProfileView, attribute: .top, multiplier: 1.0, constant: 30)
                   let marginRight = NSLayoutConstraint(item: cell.commentTimeLabel    , attribute: .right, relatedBy: .equal, toItem: cell.commentTweetText, attribute: .right, multiplier: 1.0, constant: -20)
                   NSLayoutConstraint.activate([marginTop, marginRight])
               } else {
                   cell.commentProfileView.isHidden = false
                   let imageName = imageArray[0]
                   let images = UIImage(named: imageName[0])
                   let imageView = UIImageView(image: images!)
                   cell.commentProfileView.contentMode = .scaleToFill
                   cell.commentProfileView.addSubview(imageView)
                   imageView.translatesAutoresizingMaskIntoConstraints = false
                   NSLayoutConstraint.activate([
                         imageView.widthAnchor.constraint(equalTo: cell.commentProfileView.widthAnchor, multiplier: 1.0),
                         imageView.heightAnchor.constraint(equalTo: cell.commentProfileView.heightAnchor)
                   ])

               }
               
               if comments[0][0] == "" {
                   cell.commentTweetText.isHidden = true
                   
                   let marginTop = NSLayoutConstraint(item: cell.commentProfileView, attribute: .top, relatedBy: .equal, toItem: cell.commentUserIdLabel, attribute: .top, multiplier: 1.0, constant: 30)
                   NSLayoutConstraint.activate([marginTop])
                  
               } else {
                   cell.commentTweetText.isHidden = false
                   cell.commentTweetText.text = comments[0][0]
               }
               
        if comments[1].count != 0 && comments[0][0] != "" {
                   cell.commentProfileView.isHidden = false
                   cell.commentTweetText.isHidden = false
               }

           
        return cell
        
    }
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
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
