//
//  ViewController.swift
//  HappyDictionary
//
//  Created by wangzz on 15/8/2.
//  Copyright (c) 2015年 wangzz. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    let dataManager = FGDataManager()
    let textView = UITextView()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let label:UILabel? = UILabel(frame: CGRectMake(100, 100, 100, 20))
        if let trueLabel = label {
            trueLabel.text = "good"
            trueLabel.backgroundColor = UIColor.redColor()
            self.view .addSubview(trueLabel)
            println("hello world! %@",trueLabel)
        }
        
        textView.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 300)
        textView.backgroundColor = UIColor.lightGrayColor()
        
        dataManager.fetchTranslateResult("zh", to: "en", words: "中国")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

