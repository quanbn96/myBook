//
//  DetailBook.swift
//  myBook
//
//  Created by Quan on 7/20/16.
//  Copyright © 2016 MyStudio. All rights reserved.
//

import UIKit

class DetailBook: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var myActive: UIActivityIndicatorView!
    var urlString : String!
    var type : String!
    
    @IBOutlet weak var getCurrentTime_btn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = urlString
        self.webView.delegate = self
        self.myActive.startAnimating()
        getCurrentTime_btn.hidden = true
        var urlPath = "default"
        
        switch type {
        case "PDF":
            urlPath = NSBundle.mainBundle().pathForResource(urlString, ofType: "pdf")!
        case "DOCX":
            urlPath = NSBundle.mainBundle().pathForResource(urlString, ofType: "docx")!
        case "HTML":
            urlPath = NSBundle.mainBundle().pathForResource(urlString, ofType: "html")!
            getCurrentTime_btn.hidden = false
        default:
            break
        }
        
        let url : NSURL = NSURL.fileURLWithPath(urlPath)
        let urlRequest = NSURLRequest(URL: url)
        webView.loadRequest(urlRequest)
        
    }
    
    @IBAction func getCurrentTime(sender: AnyObject) {
        self.webView.stringByEvaluatingJavaScriptFromString("hello();")
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        print("did finish load")
        myActive.hidden = true
        myActive.stopAnimating()
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        print("did Start Load")
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        print("shouldStartLoadWithRequest")
        return true
    }
    
    @IBAction func reLoad(sender: AnyObject) {
        self.webView.reload() //load lại webView
    }
    
    @IBAction func goBack(sender: AnyObject) {
        self.webView.goBack() // trở về trang trước
    }

    @IBAction func goForward(sender: AnyObject) {
        self.webView.goForward() // đến trang trước khi ấn goback
    }
    
//    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
//        print("Link sai roi")
//    }
}
