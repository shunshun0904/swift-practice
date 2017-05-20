//
//  ViewController.swift
//  Myomikuji
//
//  Created by 中村俊 on 2017/04/28.
//  Copyright © 2017年 中村俊. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Myomikuji: UILabel!
    @IBOutlet weak var mylabel: UIButton!
    @IBAction func getomikuji(_ sender: Any) {
        let results = ["カラオケ", "ゲーセン", "クラブ", "ボーリング", "ナンパ", "居酒屋", "BAR", "帰宅", "散歩", "ラーメン"]
        let random = arc4random_uniform(UInt32(results.count))
        
        self.Myomikuji.text = results[Int(random)]
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Do any additional setup after loading the view, typically from a nib.
        //        myLabel.layer.borderColor = UIColor.orange.cgColor
        //        myLabel.layer.borderWidth = 5
        //        myLabel.layer.cornerRadius = 50
        Myomikuji.layer.masksToBounds = true
        Myomikuji.layer.cornerRadius = Myomikuji.bounds.width / 2
        mylabel.layer.cornerRadius = 5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

