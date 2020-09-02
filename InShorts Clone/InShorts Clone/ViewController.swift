//
//  ViewController.swift
//  InShorts Clone
//
//  Created by Sunitha Balasubramanian on 28/08/20.
//  Copyright © 2020 Sunitha Balasubramanian. All rights reserved.
//

import UIKit
import Gemini

class ViewController: UIViewController, UIGestureRecognizerDelegate{

    @IBOutlet weak var collectionView: GeminiCollectionView!
    var count = -1
    var articles: [Articles]? = []
    var selectedURL:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let titleView = UILabel()
        //let navTitle = NSAttributedString(string: "My Feed", attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
        title = "My Feed"
        //titleView.attributedText = navTitle
        //self.navigationItem.titleView = titleView
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // Do any additional setup after loading the view.
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        swipeLeft.delegate = collectionView as! UIGestureRecognizerDelegate
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        swipeRight.delegate = collectionView as! UIGestureRecognizerDelegate
        self.view.addGestureRecognizer(swipeRight)
       
        
        fecthJson()
        navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = true
      
        collectionView.gemini
        .scaleAnimation()
            .scale(20.75)
            .scaleEffect(.scaleUp)
        
            //.translation(x: 0, y: 0, z: 0).rotationAngle(x: 0, y: 0, z: 0).ease(.easeOutExpo).shadowEffect(.nextFadeIn).maxShadowAlpha(35)
        let discoverButton = UIBarButtonItem(title: "Discover", style: .plain, target: self, action: nil)
        let backbutton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: nil)
        navigationItem.leftBarButtonItems = [backbutton,discoverButton]
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: nil)
        navigationItem.hidesBackButton = false
         
        
    }
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
       
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
                case UISwipeGestureRecognizer.Direction.left:
                    //let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let webPageViewController = self.storyboard!.instantiateViewController(identifier: "webPage") as! WebPageViewController
                    self.navigationController!.pushViewController(webPageViewController, animated: true)
                    webPageViewController.url = selectedURL
                
                case UISwipeGestureRecognizer.Direction.right:
                    let discoverViewController = self.storyboard!.instantiateViewController(identifier: "discoverVC")
                    self.navigationController?.view.layer.add(CATransition().segueFromLeft(), forKey: nil)
                    self.navigationController!.pushViewController(discoverViewController, animated: true)
                
                default:
                    break
            }
        }
    }
    
    func fecthJson() {
        let urlRequest = URLRequest(url: URL(string: "https://newsapi.org/v2/top-headlines?country=us&apikey=d5e190072c4a4b039a1ba5df5f7fd9e3")! as URL)
        let task = URLSession.shared.dataTask(with: urlRequest) {(data, response, error) in
            if error != nil {
                print(error)
                return
            }
            self.articles = [Articles]()
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String: AnyObject]
                if let articlesFromJson = json["articles"] as? [[String: AnyObject]] {
                    for articleFromJson in articlesFromJson {
                        let article = Articles()
                        if let title = articleFromJson["title"] as? String, let author = articleFromJson["author"] as? String, let desc = articleFromJson["description"] as? String, let url = articleFromJson["url"] as? String, let imgUrl = articleFromJson["urlToImage"] as? String {
                            article.author = author
                            article.desc = desc
                            article.headLines = title
                            article.url = url
                            article.imgURL = imgUrl
                        }
                        self.articles?.append(article)
                    }
                }
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            } catch let error {
                print(error)
            }
        }
        task.resume()
    }
    
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.articles!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.headerImageView.downloadImage(url: (self.articles?[indexPath.item].imgURL) ?? "")
        cell.newsDescriptionLabel.text = self.articles?[indexPath.item].desc
        cell.newsHeadingLabel.text = self.articles?[indexPath.item].headLines
        self.collectionView.animateCell(cell)
        selectedURL = self.articles?[indexPath.item].url
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.collectionView.animateVisibleCells()
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let cell = cell as? CollectionViewCell {
            self.collectionView.animateCell(cell)
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        count = count + 1
        if count % 2 == 0{
            navigationController?.isNavigationBarHidden = false
            tabBarController?.tabBar.isHidden = false
        }else{
            navigationController?.isNavigationBarHidden = true
            tabBarController?.tabBar.isHidden = true
        }
    }
}

extension UIImageView {
    func downloadImage(url: String) {
        guard let urlRequest = URL(string: url) else { return }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: urlRequest) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
extension CATransition {
    func segueFromLeft() -> CATransition {
        self.duration = 1.5
        self.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        self.type = CATransitionType.moveIn
        self.subtype = CATransitionSubtype.fromLeft
        return self
        
    }
}
