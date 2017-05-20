//
//  ViewController.swift
//  browser
//
//  Created by 中村俊 on 2017/05/12.
//  Copyright © 2017年 中村俊. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIWebViewDelegate{

        @IBOutlet weak var browserWebview: UIWebView!
        @IBOutlet weak var categorySegment: UISegmentedControl!
   var taskCategory = "CL"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.browserWebview.delegate = self
        }


    @IBAction func categoryChosen(_ sender: UISegmentedControl) {
        // choose category of task
        switch sender.selectedSegmentIndex {
        case 0:
            taskCategory = "CL"
            let urlString = "http://jp.uefa.com/uefachampionsleague/"
            let urlRequest = URLRequest(url: URL(string: urlString)!)
            self.browserWebview.loadRequest(urlRequest)
        case 1:
            taskCategory = "EL"
            let urlString = "http://jp.uefa.com/uefaeuropaleague/"
            let urlRequest = URLRequest(url: URL(string: urlString)!)
            self.browserWebview.loadRequest(urlRequest)
        case 2:
            taskCategory = "LIGA"
            let urlString = "http://www.wowow.co.jp/sports/liga/"
            let urlRequest = URLRequest(url: URL(string: urlString)!)
            self.browserWebview.loadRequest(urlRequest)
        default:
            taskCategory = "CL"
        }
    }
    
//アラートの表示
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
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}


