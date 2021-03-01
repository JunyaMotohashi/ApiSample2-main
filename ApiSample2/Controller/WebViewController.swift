//
//  WebViewController.swift
//  ApiSample2
//
//  Created by 本橋淳哉 on 2021/01/09.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKUIDelegate {
    var webView = WKWebView()
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height - 50)
        view.addSubview(webView)
        
        let urlString = UserDefaults.standard.object(forKey: "url")
        let url = URL(string: urlString as! String)
        let request = URLRequest(url: url!)
        webView.load(request)
    }
}
