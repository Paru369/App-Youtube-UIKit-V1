//
//  DetailViewController.swift
//  AppYoutube
//
//  Created by Paulo Pinheiro on 9/10/23.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var webView: WKWebView!
    
    
    
    var video: Video?
    
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
           
           // Clear the fields
           titleLabel.text = ""
           dateLabel.text = ""
           textView.text = ""
           
           // Check if there's a video
           guard video != nil else {
               return
           }
           
           // Create the embed URL
           let embedUrlString = Constants.YT_EMBED_URL + video!.videoId
           
           // Load it into the webview
           let url = URL(string: embedUrlString)
           let request = URLRequest(url: url!)
           webView.load(request)
           
           // Set the title
           titleLabel.text = video!.title
           
           // Set the date
           let df = DateFormatter()
           df.dateFormat = "EEEE, MMM d, yyyy"
           dateLabel.text = df.string(from: video!.published)
           
           // Set the description
           textView.text = video!.description
    }

}
