//
//  NYTimesDetailController.swift
//  NYTimes
//
//  Created by Mubeena K A on 25/11/2019.
//  Copyright © 2019 Nafees. All rights reserved.
//

import UIKit
import WebKit

var myContext = 0

class NYTimesDetailController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    var progressView: UIProgressView!
    var news: News?
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        self.webView = WKWebView(frame: .zero, configuration: webConfiguration)
        self.webView.uiDelegate = self
        self.webView.navigationDelegate = self
        view = self.webView
        
        // add progresbar to navigation bar
        self.progressView = UIProgressView(progressViewStyle: .default)
        self.progressView.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
        navigationController?.navigationBar.addSubview(self.progressView)
        self.progressView.frame = CGRect(x: 0, y: 42, width: 375, height: 2)
    }
    
    // deinit
    deinit {
        // remove progress bar from navigation bar
        //progressView.removeFromSuperview()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let urlString = news?.url, let webUrl = URL(string: urlString) {
            let myRequest = URLRequest(url: webUrl)
            self.webView.load(myRequest)
            webView.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: &myContext)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
         webView.removeObserver(self, forKeyPath: "estimatedProgress")
         progressView.removeFromSuperview()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // observer
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey: Any]?, context: UnsafeMutableRawPointer?) {
        
        guard let change = change else { return }
        if context != &myContext {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
            return
        }
        
        if keyPath == "estimatedProgress" {
            if let progress = (change[NSKeyValueChangeKey.newKey] as AnyObject).floatValue {
                self.progressView.progress = progress
            }
            return
        }
    }

}

extension NYTimesDetailController : WKUIDelegate, WKNavigationDelegate{
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.progressView.isHidden = true
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        self.progressView.isHidden = false
    }
    
}
