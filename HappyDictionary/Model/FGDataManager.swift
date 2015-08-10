//
//  FGDataManager.swift
//  HappyDictionary
//
//  Created by wangzz on 15/8/2.
//  Copyright (c) 2015年 wangzz. All rights reserved.
//

import UIKit

//from	源语言语种	目前支持中文、英文
//to	目标语言语种	目前支持中文、英文
//client_id	开发者在百度开发者中心注册得到的授权API key	点此创建工程获取API
//q	请求的词语	UTF-8，urlencode编码

class FGDataManager: NSObject {
    // 百度翻译URL
    let translateURL = "http://openapi.baidu.com/public/2.0/bmt/translate"
    
    // 百度词典URL
    let dicURL = "http://openapi.baidu.com/public/2.0/translate/dict/simple"
    func fetchTranslateResult(from: NSString, to: NSString, words: NSString, disposeResult:(FGTranslation)->Void) {
        request(.GET, dicURL, parameters: ["from" : from, "to" : to, "client_id" : "9m87vtWabfTk1NpxbLBKZVxp", "q":words])
            .response { request, response, data, error in
                let json: AnyObject? = NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers, error: nil)
                
                if let resultDic = json as? NSDictionary {
                    let translation = FGTranslation(dic:resultDic);
                    disposeResult(translation)
                }
        }
    }
    
}
