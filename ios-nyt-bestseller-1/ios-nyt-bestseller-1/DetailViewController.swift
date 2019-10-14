//
//  DetailViewController.swift
//  ios-nyt-bestseller-1
//
//  Created by Mario Holper on 11.10.19.
//  Copyright © 2019 Mario Holper. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var webview: UIWebView!
    var book: Book?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = book?.title
        
        if let mybook = book, let myurl = mybook.url {
            webview.loadRequest(URLRequest(url: myurl))
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
