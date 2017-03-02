//
//  Cell.swift
//  OurskyTest
//
//  Created by エリック on 2017/03/02.
//  Copyright © 2017年 エリック. All rights reserved.
//

import UIKit

class Cell: UITableViewCell {
    
    
    @IBOutlet weak var TODOTextField: UILabel!
    
    
    @IBOutlet weak var timer: UILabel!
    
    var counter = 0;
    var position = 0;
    
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
         var _ = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func DoneBtnPressed(_ sender: Any) {
        DataService.instance.removeThingstodo(position: position)
        counter = -1
         
    }
    
    @IBAction func StopBtnPressed(_ sender: Any) {
    }
    
    
    func configCell(todo : thingsToDo, position: Int){
        
        self.position = position
        
        TODOTextField.text = todo.thingsToDoName
        print(todo.time)
       
        counter = Int(todo.time)! * 10
        timer.text = "\(counter)sec"


    }
    
    
    func updateCounter() {
        //you code, this is an example
        if (counter > 0) {
            print("\(counter) seconds to the end of the world")
            counter -= 1
            timer.text = "\(counter)sec"
        }else if (counter == 0){
            let refreshAlert = UIAlertController(title: "Time's up", message: "", preferredStyle: UIAlertControllerStyle.alert)
            
            refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
               DataService.instance.removeThingstodo(position: self.position)
                self.counter = -1
                return ;
            }))
            
            refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
                print("Handle Cancel Logic here")
            }))
            
    
            UIApplication.shared.delegate?.window??.rootViewController?.present(refreshAlert, animated: true, completion: nil)
        }else if (counter < 0){
            
        }
        
//        DataService.instance.removeThingstodo(position: position)
    }
    
}
