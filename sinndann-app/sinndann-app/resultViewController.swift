//
//  resultViewController.swift
//  sinndann-app
//
//  Created by 中村俊 on 2017/05/09.
//  Copyright © 2017年 中村俊. All rights reserved.
//

import UIKit

class resultViewController: UIViewController {
    var myName: String = ""
    
    func arc4random(lower: UInt32, upper: UInt32) -> UInt32 {
        guard upper >= lower else {
            return 0
        }
        
        return arc4random_uniform(upper - lower) + lower
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initImageView()
        
        self.nameLabel.text = "\(self.myName)の偏差値は..."
        // 25 - 80
        self.scoreLabel.text = String(
            arc4random(lower: 20, upper: 80)
        )
        
        // Do any additional setup after loading the view.
    }
    
    private func initImageView(){
        // UIImage インスタンスの生成
        let image1:UIImage = UIImage(named:"imgres-2.jpg")!
        
        // UIImageView 初期化
        let imageView = UIImageView(image:image1)
        
        // 画面の横幅を取得
        let screenWidth:CGFloat = view.frame.size.width
        let screenHeight:CGFloat = view.frame.size.height

        // 画像の中心を画面の中心に設定
        imageView.center = CGPoint(x:screenWidth/2, y:screenHeight*2/3)
        
        
        // UIImageViewのインスタンスをビューに追加
        self.view.addSubview(imageView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
