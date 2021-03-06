//
//  ViewController.swift
//  WebView App
//
//  Created by Pankaj Negi on 11/04/19.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate  {
    
    var webView: WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let url = URL(string: "https://www.crimsonperformance.com/")!
        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest);
        
        
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
        
        let newBackButton = UIBarButtonItem(image: UIImage(named: "back"), style: .plain, target: self, action: #selector(self.back))
        let newForwordButton =  UIBarButtonItem(image: UIImage(named: "forward"), style: .plain, target: self, action: #selector(self.forward))
        toolbarItems = [refresh, newBackButton, newForwordButton]
        navigationController?.isToolbarHidden = false
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }
    
    @objc func back(sender: UIBarButtonItem) {
        if(webView.canGoBack) {
            webView.goBack()
        } else {
            self.navigationController?.popViewController(animated:true)
        }
    }
    
    @objc func forward(sender: UIBarButtonItem) {
        if(webView.canGoForward) {
            webView.goForward()
        }
    }
    

}

