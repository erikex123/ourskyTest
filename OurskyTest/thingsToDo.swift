//
//  thingsToDo.swift
//  OurskyTest
//
//  Created by エリック on 2017/03/02.
//  Copyright © 2017年 エリック. All rights reserved.
//

import Foundation

class thingsToDo : NSObject, NSCoding{
    
    var _thingsToDoName: String!
    var _time : String!
    
    var thingsToDoName: String{
        
        set{
            _thingsToDoName = newValue
        }get{
            return _thingsToDoName

        }
          }
    
    var time: String{
        
        set{
            _time = newValue
        }get{
            if( _time != nil ){
            
              return _time
            }else {
                return "0";
            }
        }
    }
    
    
    
    init(thingstoDo: String, timeRequired:String ){
        self._thingsToDoName = thingstoDo
        self._time = timeRequired
    }
    
    
    
    override init() {
        
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self._thingsToDoName, forKey: "imagePath")
        aCoder.encode(self._time, forKey: "description")
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        self._thingsToDoName = aDecoder.decodeObject(forKey: "imagePath") as? String
        self._time = aDecoder.decodeObject(forKey: "description") as? String
        }
    
}

