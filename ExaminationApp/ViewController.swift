//
//  ViewController.swift
//  ExaminationApp
//
//  Created by 浅野　宏明 on 2016/07/23.
//  Copyright © 2016年 akylab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    /// 演算子のリスト
    private let operatorList = [
        "+",
        "-",
        "×",
        "÷",
    ]
    
    /// 選択中の演算子
    private var selectedOperator = "+"
    
    /// 値1の入力フィールド
    @IBOutlet private var value1: UITextField!
    /// 値2の入力フィールド
    @IBOutlet private var value2: UITextField!
    
    /// 計算結果のフィールド
    @IBOutlet weak var resultLabel: UILabel!
    
    
    /// 計算実行ボタン押下時の処理
    @IBAction private func calcurate(_: UIButton) {
        
        // let result = Int(value1.text!)! + Int(value2.text!)!
        // 値1、値2、演算子を一度文字列として取得
        let val = NSExpression(format: String(UTF8String: value1.text!)!  + String(selectedOperator) + String(UTF8String: value2.text!)!)
        
        print(val)
        
        // 文字列を数式化
        let result = val.expressionValueWithObject(nil, context: nil) as! Int
        
        // TODO: 計算結果ラベルの値を書き換えるようにする
        // print("result: \(result)")
        resultLabel.text = String(result)
    }
    
}

extension ViewController: UIPickerViewDataSource {
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        // ピッカーのコンポーネントの数を返す
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        // コンポーネント毎の行数を返す
        return 4
    }
}

extension ViewController: UIPickerViewDelegate {
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // 行のラベルとなる文字列を返す
        return operatorList[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // 行を選択した時のアクションを定義
        // TODO: 選択した演算子で selectedOperator を上書きする
        switch operatorList[row] {
            case "+":
            selectedOperator = "+"
            
            case "-":
            selectedOperator = "-"
            
            case "×":
            selectedOperator = "*"
            
            case "÷":
            selectedOperator = "/"
            
            default:
            break
        }
    }
}
