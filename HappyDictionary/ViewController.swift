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
    var translation :FGTranslation?
    @IBOutlet var tableView: UITableView!
    @IBOutlet var searchButton: UIButton!
    @IBOutlet var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func reloadTableView(translation:FGTranslation) {
        self.translation = translation
        self.tableView.reloadData()
    }
    
    func dismissKeyBard() {
        self.textField.resignFirstResponder()
    }
    
    @IBAction func onSearchButtonAction(sender: UIButton) {
        self.dismissKeyBard()
        
//        dataManager.fetchTranslateResult("zh", to: "en", words: "中国")
        dataManager.fetchTranslateResult("en", to: "zh", words: "data", disposeResult: reloadTableView)
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        self.dismissKeyBard()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let translationResult = self.translation {
            return translationResult.symbols.first!.parts.count
        } else {
            return 0;
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

}

