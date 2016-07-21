//
//  LoadURL.swift
//  myBook
//
//  Created by Quan on 7/20/16.
//  Copyright © 2016 MyStudio. All rights reserved.
//

import UIKit

class LoadURL: UIViewController, UITextFieldDelegate, UIWebViewDelegate {

    @IBOutlet weak var urlString: UITextField!
    @IBOutlet weak var wedView: UIWebView!
    @IBOutlet weak var myActive: UIActivityIndicatorView!
    let baseUrl = "http://www."
    
    override func viewDidLoad() {
        myActive.hidden = true
        super.viewDidLoad()
        urlString.delegate = self
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        myActive.hidden = false
        let url = NSURL(string: baseUrl + textField.text!)!
        let urlRequest = NSURLRequest(URL: url)
        self.wedView.loadRequest(urlRequest)
        myActive.startAnimating()
        return true
    }

}
