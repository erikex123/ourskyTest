//
//  DataService.swift
//  OurskyTest
//
//  Created by エリック on 2017/03/02.
//  Copyright © 2017年 エリック. All rights reserved.
//

import Foundation
import UIKit


class DataService {
    
    static let instance = DataService()
    
    private var _loadedThingsToDo = [thingsToDo]()
    
    var loadedThingsToDo: [thingsToDo]{
        return _loadedThingsToDo
    }
    
    func saveThingsToDo(){
        let postData = NSKeyedArchiver.archivedData(withRootObject: _loadedThingsToDo)
        UserDefaults.standard.set(postData, forKey: "thingsTodo")
        UserDefaults.standard.synchronize()
    }
    
    func loadThingsTodo(){
        if let thingsTodoData = UserDefaults.standard.object(forKey: "thingsTodo") as? Data{
            if let postsArray = NSKeyedUnarchiver.unarchiveObject(with: thingsTodoData) as? [thingsToDo]{
                _loadedThingsToDo = postsArray
            }
        }
        
        NotificationCenter.default.post(Notification(name: Notification.Name(rawValue: "postsLoaded"), object: nil))
        
        
    }
    
    
    func removeThingstodo( position: Int){
        if let thingsTodoData = UserDefaults.standard.object(forKey: "thingsTodo") as? Data{
            if var postsArray = NSKeyedUnarchiver.unarchiveObject(with: thingsTodoData) as? [thingsToDo]{
                
                if (position > postsArray.count || position < 0){
                    return
                }else{
                
                postsArray.remove(at: position)
                }
                _loadedThingsToDo = postsArray
                saveThingsToDo()
                
            }
            
        }
        NotificationCenter.default.post(Notification(name: Notification.Name(rawValue: "postsLoaded"), object: nil))
    }
    
    func addthingsTodo(thingtodo: thingsToDo){
        _loadedThingsToDo.insert(thingtodo, at: 0)
        saveThingsToDo()
        loadThingsTodo()
    }
    
}
