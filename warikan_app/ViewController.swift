//
//  ViewController.swift
//  warikan_app
//
//  Created by 青柳瑞子 on 2017/04/15.
//  Copyright © 2017年 青柳瑞子. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var totalField: UITextField!
    @IBOutlet weak var peopleField: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func calculate(_ sender: Any) {
    
        // もし会計・人数のテキストフィールドに値が入っていなかったら何もしない
        if (totalField.text == nil || peopleField.text == nil) {
        return
        }
    
        // 各テキストフィールドのtextは文字列型（String）が入っているので、小数型(Double)に変換する
        let total = Double(totalField.text!)!
        let people = Double(peopleField.text!)!
    
        // 会計金額から人数分を割った数字をsplitに代入
        let split = total / people
    
        // 端数も支払う必要があるので、割りきれなかった分を切り上げる
        let result = ceil(split)
    
        // 一人分の支払額 * 人数をamountに代入
        let amount = result * people
    
        //お釣りがあるかどうか判定。あったらお釣りを計算しだす
        var change = 0.0
        if amount > total {
        change = amount - total
        }
    
        // 計算した結果をresultLabelに出力！
        // そのままだと小数点以下も表示されてしまうので、整数型（Integer）に変換しています
        resultLabel.text = "一人あたり：\(Int(result))円\nお釣り：\(Int(change))円"
    }

}

