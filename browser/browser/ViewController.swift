//
//  ViewController.swift
//  browser
//
//  Created by 中村俊 on 2017/05/12.
//  Copyright © 2017年 中村俊. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIWebViewDelegate, UITextFieldDelegate{

    @IBOutlet weak var urlTextfield: UITextField!
    @IBOutlet weak var browserWebview: UIWebView!
    
    @IBOutlet weak var backButton: UIBarButtonItem!
    
    @IBOutlet weak var nextButton: UIBarButtonItem!
    
    @IBOutlet weak var reloadButton: UIBarButtonItem!
    
    @IBOutlet weak var browserActivity: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.browserWebview.delegate = self
        self.browserActivity.hidesWhenStopped = true
        self.urlTextfield.delegate = self
    }

//検索機能追加
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField != self.urlTextfield {
            return true
        }
        if let urlString = textField.text {
            self.loadUrl(urlString: urlString)
        }
        return true
    }

//検索バーの全選択可能
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField != self.urlTextfield{
            return
        }
        textField.selectedTextRange = textField.textRange(from: textField.beginningOfDocument, to: textField.endOfDocument)

    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        self.browserActivity.startAnimating()
    }
  
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        if let urlString = self.browserWebview.request?.url?.absoluteString {
            self.urlTextfield.text = urlString
        }
    self.browserActivity.stopAnimating()
    self.backButton.isEnabled = self.browserWebview.canGoBack
    self.nextButton.isEnabled = self.browserWebview.canGoForward
    }
   
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let urlString = "http://dotinstall.com"
        //        let urlString = ""
        self.loadUrl(urlString: urlString)
        self.addBorder()
    }
    
//ウェブビューと検索バーとの境界線の表示
    func addBorder() {
        let topBorder = CALayer()
        topBorder.frame = CGRect(x: 0.0, y: 0.0, width: self.browserWebview.frame.size.width, height: 1.0)
        topBorder.backgroundColor = UIColor.lightGray.cgColor
        self.browserWebview.layer.addSublayer(topBorder)
    }
    
    func showAlert(_ message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
//nettowa-kuエラー時の検出と表示
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        if (error as! URLError).code == URLError.cancelled {
            return
        }
        self.showAlert("Network Error")
        self.browserWebview.stopLoading()
        self.browserActivity.stopAnimating()
    }
 
//url検索の前後での空白の無効化
    func getValidatedUrl(urlString: String) -> URL? {
        let trimmed = urlString.trimmingCharacters(in: NSCharacterSet.whitespaces)
        if URL(string: trimmed) == nil {
            //            print("Invalid URL")
            self.showAlert("Invalid URL")
            return nil
        }
        return URL(string: self.appendScheme(trimmed))
    }
   
    
//httpの省略
    func appendScheme(_ urlString: String) -> String {
        if URL(string: urlString)?.scheme == nil {
            return "http://" + urlString
        }
        return urlString
    }
    
    func loadUrl(urlString: String) {
        if let url = self.getValidatedUrl(urlString: urlString) {
            let urlRequest = URLRequest(url: url)
            self.browserWebview.loadRequest(urlRequest)
        }
    }

    @IBAction func goBackbutton(_ sender: Any) {
        self.browserWebview.goBack()
    }

    
    @IBAction func goForward(_ sender: Any) {
        self.browserWebview.goForward()
        
    }
    
    @IBAction func goReload(_ sender: Any) {
        self.browserWebview.reload()
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}


