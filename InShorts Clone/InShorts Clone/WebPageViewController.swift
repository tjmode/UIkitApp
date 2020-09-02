//
//  WebPageViewController.swift
//  InShorts Clone
//
//  Created by Sunitha Balasubramanian on 31/08/20.
//  Copyright © 2020 Sunitha Balasubramanian. All rights reserved.
//

import UIKit
import WebKit

class WebPageViewController: UIViewController {
    var webView: WKWebView!
    var url: String = ""
    override func loadView() {
        webView = WKWebView()
        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let webPageUrl = URL(string: url)
        webView.load(URLRequest(url: webPageUrl!))
        

        // Do any additional setup after loading the view.
        navigationController?.isNavigationBarHidden = false
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis"), style: .plain, target: self, action: nil)
        title = url
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
