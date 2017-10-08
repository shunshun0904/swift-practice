//
//  ViewController.swift
//  countdown
//
//  Created by 中村俊 on 2017/05/11.
//  Copyright © 2017年 中村俊. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    
    
    
    let noodleTime: TimeInterval = 60 * 3  // カップラーメンの出来上がり時間 60秒×3
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
            }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // タイマー処理
    func tickTimer(_ timer: Timer) {
        
        //NSLog(@"タイマー表示");
        
        // 時間書式の設定
        let df:DateFormatter = DateFormatter()
        df.dateFormat = "mm:ss"
        
        // 基準日時の設定 ３分を日付型に変換
        let dt:Date = df.date(from: timerLabel.text!)!
        
        // カウントダウン
        let dt02 = Date(timeInterval: -1.0, since: dt)
        
        self.timerLabel.text = df.string(from: dt02)
        
        // 終了判定 3分が00:00になったら isEqualToString:文字の比較
        if self.timerLabel.text == "00:00" {
        
            // バックアップ背景色の変更
            //self.view.backgroundColor = UIColor.red
            
            // タイマーの停止
            timer.invalidate()
        }
    }

    
    @IBAction func timerStart(_ sender: Any) {
        // 背景色
        //self.view.backgroundColor = UIColor.yellow
                // タイマー生成、開始 １秒後の実行
        let tmr: Timer! = Timer.scheduledTimer(
            timeInterval: 1.0,                              // 時間間隔
            target: self,                       // タイマーの実際の処理の場所
            selector: #selector(ViewController.tickTimer(_:)),   // メソッド タイマーの実際の処理
            userInfo: nil,
            repeats: true)                      // 繰り返し
        tmr.fire()
    
    }
    
}

