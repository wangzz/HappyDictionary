//
//  FGTranslation.swift
//  HappyDictionary
//
//  Created by wangzz on 15/8/2.
//  Copyright (c) 2015年 wangzz. All rights reserved.
//

import UIKit

class FGTranslation: NSObject {
    let from: NSString
    let to: NSString
    let word: NSString
    var symbols: [FGSymbol] = []
    
    init(dic: NSDictionary) {
        if let fromObj = dic["from"] as? NSString {
            from = fromObj
        } else {
            from = ""
        }
        
        if let toObj = dic["to"] as? NSString {
            to = toObj
        } else {
            to = ""
        }
        
        if let dataObj = dic["data"] as? NSDictionary {
            if let wordObj = dataObj["word_name"] as? NSString {
                word = wordObj
            } else {
                word = ""
            }
            
            if let symbolsObj = dataObj["symbols"] as? NSArray {
                for value in symbolsObj {
                    if let valueDic = value as? NSDictionary {
                        symbols.append(FGSymbol(dic: valueDic))
                    }
                }
            }
        } else {
            word = ""
        }
    }
}


class FGSymbol: NSObject {
    let ph_zh: NSString?
    let ph_am: NSString?
    let ph_en: NSString?
    var parts: [FGPart] = []
    
    init(dic: NSDictionary) {
        let objZH: AnyObject? = dic["ph_zh"]
        if let zh = objZH as? NSString {
            self.ph_zh = zh
        } else {
            self.ph_zh = ""
        }
        
        let objAM: AnyObject? = dic["ph_am"]
        if let am = objAM as? NSString {
            ph_am = am
        } else {
            ph_am = ""
        }
        
        let objEN: AnyObject? = dic["ph_en"]
        if let en = objEN as? NSString {
            ph_en = en
        } else {
            ph_en = ""
        }
        
        let objParts: AnyObject? = dic["parts"]
        if let partArray = objParts as? NSArray {
            for value in partArray {
                if let valueObj = value as? NSDictionary {
                    parts .append(FGPart(dic: valueObj))
                }
            }
        }
    }
}

class FGPart: NSObject {
    var means: [NSString] = []
    let part: NSString
    
    init(dic: NSDictionary) {
        let objPart: AnyObject? = dic["part"]
        if let partString = objPart as? NSString {
            part = partString
        } else {
            part = ""
        }
        
        let obj: AnyObject? = dic["means"]
        if let meansArray = obj as? NSArray {
            for value in meansArray {
                self.means.append(value as! NSString);
            }
        }
    }
}

