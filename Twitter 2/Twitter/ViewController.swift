//
//  ViewController.swift
//  Twitter
//
//  Created by Sunitha Balasubramanian on 07/08/20.
//  Copyright © 2020 Sunitha Balasubramanian. All rights reserved.
//

import UIKit
 
struct Twitter: Codable{
    let name: String
    let userId: String
    let profileImage: String
    let image: [String]
    let tweetText: String
    let comments: [String]
    let commentsImage: [String]
    let commentedProfile: [String]

    
}
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  enum Constants {
        static let trailingValue: CGFloat = 15.0
        static let leadingValue: CGFloat = 95.0
        static let buttonWidth: CGFloat = 60.0
        static let buttonHeight: CGFloat = 60.0
    }

   // var imageArray = ["Picture", "Picture", "Picture", "Picture", "Picture", "Picture", "Picture"]
   // var selectedIndexPath: NSIndexPath = NSIndexPath()
    var selectedIndexPath = 0
    var frameX = 100
    var frameY = 100
    let floatingButton = UIButton(type: .custom)
    var names = [String]()
    var userId = [String]()
    var profileImage = [String]()
    var imageArray = [[String]]()
    var tweetText = [String]()
    var comments = [[String]]()
    var commentsImage = [[String]]()
    var commentedProfile = [[String]]()
    var val = ""
    

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        title = "Home"
        setupProfileImage()
        createFloatingButton()
        fetchJson()
    
    }
    func fetchJson(){
        do {
            let url = Bundle.main.url(forResource: "Profile", withExtension: "json")
            
            let jsonData = try Data(contentsOf: url!)
            let post = try JSONDecoder().decode([Twitter].self, from: jsonData)
            for each in post {
               // names = each.name
                names.append(each.name)
                userId.append(each.userId)
                profileImage.append(each.profileImage)
               // userId = each.userId
               // imageArray = each.image
                imageArray.append(each.image)
                tweetText.append(each.tweetText)
                
                //tweetText = each.tweetText
                comments.append(each.comments)
               // comments = each.comments
                commentsImage.append(each.commentsImage)
              //  commentsImage = each.commentsImage
              //  commentedProfile = each.commentedProfile
                commentedProfile.append(each.commentedProfile)
                
            }
        } catch let error as NSError{
            print(error.localizedDescription)
        }
        
    }

    
    private func createFloatingButton() {
        floatingButton.backgroundColor = .clear
        floatingButton.translatesAutoresizingMaskIntoConstraints = false
        constrainFloatingButtonToWindow()
        floatingButton.setImage(UIImage(named: "logo-2"), for: .normal)
        floatingButton.clipsToBounds = true
        floatingButton.layer.cornerRadius = 30
        
       }

       private func constrainFloatingButtonToWindow() {
           DispatchQueue.main.async {
               guard let keyWindow = UIApplication.shared.keyWindow,
                let floatingButton: UIButton = self.floatingButton else { return }
               keyWindow.addSubview(floatingButton)
               keyWindow.trailingAnchor.constraint(equalTo: floatingButton.trailingAnchor,
                                                   constant: Constants.trailingValue).isActive = true
               keyWindow.bottomAnchor.constraint(equalTo: floatingButton.bottomAnchor,
                                                 constant: Constants.leadingValue).isActive = true
               floatingButton.widthAnchor.constraint(equalToConstant:
                   Constants.buttonWidth).isActive = true
               floatingButton.heightAnchor.constraint(equalToConstant:
                   Constants.buttonHeight).isActive = true
           }
       }

   
    func setupProfileImage() {
        let image = UIImage(named: "Picture")
        let button = UIButton()
        button.setImage(image, for: UIControl.State.normal)
        button.frame = CGRect(x: 0, y: 0, width: 36, height: 36)
        button.layer.cornerRadius = button.bounds.width / 2
            button.layer.masksToBounds = true
            let barButton = UIBarButtonItem(customView: button)
        let currWidth = barButton.customView?.widthAnchor.constraint(equalToConstant: 36)
        currWidth?.isActive = true
        let currHeight = barButton.customView?.heightAnchor.constraint(equalToConstant: 36)
        currHeight?.isActive = true
            self.navigationItem.leftBarButtonItem = barButton
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeTableViewCell
        cell.profileImage.layer.borderWidth = 0.1
        cell.profileImage.layer.masksToBounds = false
        cell.profileImage.layer.cornerRadius = cell.profileImage.frame.size.width / 2
        cell.profileImage.layer.cornerRadius = cell.profileImage.frame.size.height / 2
        cell.profileImage.clipsToBounds = true
        cell.profileImage.layer.borderColor = UIColor.black.cgColor
        cell.userNameLabel.text = names[indexPath.row]
//        let previewButton = UIButton()
//        previewButton.frame = CGRect(x: 0, y: 0, width: 309, height: 200)
//        previewButton.addTarget(self, action: #selector(pressed), for: .touchUpInside)
//        cell.profileView.addSubview(previewButton)

        
//        if imageArray.count == 1 {
//            let imageName = imageArray[0]
//            let images = UIImage(named: imageName)
//            let imageView = UIImageView(image: images!)
//            imageView.frame = CGRect(x: 0, y: 0, width: 309, height: 200)
//            cell.profileView.addSubview(imageView)
//            } else if imageArray.count == 2 {
//                let imageName = imageArray[0]
//                let images = UIImage(named: imageName)
//                let imageView = UIImageView(image: images!)
//            imageView.frame = CGRect(x: 150, y: 0, width: 154.5, height: 200)
//
//                let imageName2 = imageArray[1]
//                let images2 = UIImage(named: imageName2)
//                let imageView2 = UIImageView(image: images2!)
//            imageView2.frame = CGRect(x: 0, y: 0, width: 154.5, height: 200)
//            cell.profileView.addSubview(imageView)
//               cell.profileView.addSubview(imageView2)
//
//            } else if imageArray.count == 3 {
//                let imageName = imageArray[0]
//                let images = UIImage(named: imageName)
//                let imageView = UIImageView(image: images!)
//            imageView.frame = CGRect(x: 0, y: 0, width: 154.5, height: 200)
//               cell.profileView.addSubview(imageView)
//
//                let imageName2 = imageArray[1]
//                let images2 = UIImage(named: imageName2)
//                let imageView2 = UIImageView(image: images2!)
//            imageView2.frame = CGRect(x: 150, y: 0, width: 154.5, height:100)
//                cell.profileView.addSubview(imageView2)
//
//                let imageName3 = imageArray[2]
//                let images3 = UIImage(named: imageName3)
//                let imageView3 = UIImageView(image: images3!)
//            imageView3.frame = CGRect(x: 150, y: 100, width: 154.5, height: 100)
//                cell.profileView.addSubview(imageView3)
//            } else {
//                let imageName = imageArray[0]
//                    let images = UIImage(named: imageName)
//                    let imageView = UIImageView(image: images!)
//                imageView.frame = CGRect(x: 0, y: 0, width: 154.5, height: 200)
//                   cell.profileView.addSubview(imageView)
//
//                    let imageName2 = imageArray[1]
//                    let images2 = UIImage(named: imageName2)
//                    let imageView2 = UIImageView(image: images2!)
//                imageView2.frame = CGRect(x: 150, y: 0, width: 154.5, height:100)
//                    cell.profileView.addSubview(imageView2)
//                    let imageName3 = imageArray[2]
//                    let images3 = UIImage(named: imageName3)
//                    let imageView3 = UIImageView(image: images3!)
//                imageView3.frame = CGRect(x: 150, y: 100, width: 154.5, height: 100)
//                    cell.profileView.addSubview(imageView3)
//                let coverLayer = CALayer()
//                coverLayer.frame = imageView3.bounds
//                coverLayer.backgroundColor = UIColor.black.cgColor
//                coverLayer.opacity = 0.7
//                imageView3.layer.addSublayer(coverLayer)
//            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 150, height: 121))
//                label.text = "+\(imageArray.count - 3)"
//                label.textColor = UIColor.white
//                label.font = label.font.withSize(30)
//                cell.profileView.addSubview(label)
//            }
        
        if imageArray.count == 0 {
            cell.profileView.isHidden = true
            let marginTop = NSLayoutConstraint(item: cell.buttonStack, attribute: .top, relatedBy: .equal, toItem: cell.profileView, attribute: .top, multiplier: 1.0, constant: 50)
            let marginRight = NSLayoutConstraint(item: cell.buttonStack, attribute: .right, relatedBy: .equal, toItem: cell.profileView, attribute: .right, multiplier: 1.0, constant: -20)
            NSLayoutConstraint.activate([marginTop, marginRight])
        } else {
            
            cell.profileView.isHidden = false
            let imageName = imageArray[indexPath.row]
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
        
        if tweetText.count == 0 {
            cell.tweetText.isHidden = true
            let heightProfileView = NSLayoutConstraint(item: cell.profileView, attribute: .height, relatedBy: .equal, toItem: cell.userNameLabel, attribute: .height, multiplier: 1.0, constant: cell.profileView.frame.size.height)
            let marginTopProfileView = NSLayoutConstraint(item: cell.profileView, attribute: .top, relatedBy: .equal, toItem: cell.userNameLabel, attribute: .top, multiplier: 1.0, constant: 50)
            let marginRightProfileView = NSLayoutConstraint(item: cell.profileView, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1.0, constant: -20)
            let marginTop = NSLayoutConstraint(item: cell.buttonStack, attribute: .top, relatedBy: .equal, toItem: cell.profileView, attribute: .top, multiplier: 1.0, constant: 300)
            let marginRight = NSLayoutConstraint(item: cell.buttonStack, attribute: .right, relatedBy: .equal, toItem: cell.profileView, attribute: .right, multiplier: 1.0, constant: -20)
            NSLayoutConstraint.activate([marginTop, marginRight, marginTopProfileView, marginRightProfileView, heightProfileView])
        } else {
            cell.tweetText.isHidden = false
            cell.tweetText.text = tweetText[indexPath.row]
        }
        
        if imageArray.count != 0 && tweetText.count != 0 {
            cell.profileView.isHidden = false
            cell.tweetText.isHidden = false
        }
//
        //cell.tweetText.isHidden = true
//        cell.profileView.isHidden = true
//        var text = "Hello"
//        if text != "" {
//            cell.tweetText.text = text
//            cell.tweetText.isHidden = false
//            frameX = Int(cell.tweetText.frame.size.height) + 250
//        }
//        let marginTop = NSLayoutConstraint(item: cell.buttonStack, attribute: .top, relatedBy: .equal, toItem: cell.userNameLabel, attribute: .top, multiplier: 1.0, constant: CGFloat(CGFloat(frameX) + cell.userNameLabel.frame.size.height))
//        let marginRight = NSLayoutConstraint(item: cell.buttonStack, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1.0, constant: -20)
//        NSLayoutConstraint.activate([marginTop, marginRight])
       // let singleTap = UITapGestureRecognizer(target: self, action: Selector(("imageTapped")))
//        
//        cell.profileImage.isUserInteractionEnabled = true
//        cell.profileImage.addGestureRecognizer(singleTap)
//        cell.profileImage.addGestureRecognizer(target(forAction: #selector(imageTapped), withSender: nil) as! UIGestureRecognizer)
   //     print(indexPath.row)
        return cell
    }
    
    @IBAction func homePage(_ sender: Any) {
        self.performSegue(withIdentifier: "profileImage", sender: self)
        
    }
    //   var valuePass:String!
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
         print(names[selectedIndexPath])
        self.selectedIndexPath = indexPath.row
        self.performSegue(withIdentifier: "Tweet", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
        self.performSegue(withIdentifier: "profileImage", sender: self)
        
        
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = self.selectedIndexPath
        if (segue.identifier == "Tweet"){
            if let vc = segue.destination as? TweetViewController {
                vc.userName = ["\(names[selectedIndexPath])", "\(userId[selectedIndexPath])","\(profileImage[selectedIndexPath])"]
                vc.imageArray = [imageArray[selectedIndexPath],[tweetText[selectedIndexPath]]]
                vc.comments = [comments[selectedIndexPath],commentsImage[selectedIndexPath],commentedProfile[selectedIndexPath]]
                 val = names[selectedIndexPath]
            }
            if (segue.identifier == "profileImage") {
                if let profileVc = segue.destination as? ProfileViewController{
                profileVc.userDetails = ["Sunitha", "Suji"]
             }
                
            }
        }
    }


    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
    
//    @objc func pressed(sender: UIButton!) {
//        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "popup") as! PopOverViewController
//        popOverVC.view.frame = self.view.frame
//        self.view.addSubview(popOverVC.view)
//        popOverVC.didMove(toParent: self)
//    }
//    func imageTapped() {
//        self.present(ProfileViewController(), animated: true)
//    }

}
