//
//  ViewController.swift
//  OurskyTest
//
//  Created by エリック on 2017/03/02.
//  Copyright © 2017年 エリック. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var dummyThingTodo: thingsToDo = thingsToDo(thingstoDo: "", timeRequired: "")
    var todolist = [thingsToDo]()
    
    
    //outlets
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        DataService.instance.loadThingsTodo()
  
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.onPostsLoaded(_:)), name: NSNotification.Name(rawValue: "postsLoaded"), object: nil)
        
    }
    
    @IBAction func sendBtn(_ sender: Any) {
        
        if textfield.text != nil{
            
        
//            dummyThingTodo.thingsToDoName = textfield.text!
 
            presentAlert()
            
            
//            DataService.instance.addthingsTodo(thingtodo: dummyThingTodo)
            
            
            print("")
        }else {
            
        }
        
        
    }
    
    func presentAlert()  {
        let alertController = UIAlertController(title: "Time?", message: "Please input the Time needed", preferredStyle: .alert)
        var text1 = ""
        let confirmAction = UIAlertAction(title: "Confirm", style: .default) { (_) in
            if let field = alertController.textFields?[0] {
                // store your data
                self.dummyThingTodo.thingsToDoName = self.textfield.text!

               self.dummyThingTodo.time = field.text!;
            
                print(self.dummyThingTodo.time)
                
                let dummy = thingsToDo(thingstoDo: self.dummyThingTodo.thingsToDoName, timeRequired:self.dummyThingTodo.time)
            DataService.instance.addthingsTodo(thingtodo:dummy )
                
            } else {
                // user did not fill field
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
        
        alertController.addTextField { (textField) in
            textField.placeholder = "time needed (in mins)"
        }
        
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        
        self.present(alertController, animated: true, completion: nil)
        
      
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let todoitem = DataService.instance.loadedThingsToDo[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? Cell {
            
            cell.configCell(todo: todoitem, position: indexPath.row)
            
            return cell
        }
        
        return UITableViewCell();
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.loadedThingsToDo.count;
    }
    
    func onPostsLoaded(_ notif: AnyObject){
        tableView.reloadData()
    }
    
}

