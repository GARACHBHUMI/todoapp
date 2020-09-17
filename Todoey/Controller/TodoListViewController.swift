//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemarray = [Item]()
    
    var userdefault = UserDefaults.standard// userdefaluts.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let items =  userdefault.array(forKey: "ToDoListArray") as? [String]
        {
            itemarray = items
        }
    }
//MARK
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemarray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

       let cell =  UITableViewCell(style: .default, reuseIdentifier: "ToDoItemCell")
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemarray[indexPath.row]
        return cell
    }
   
    //MARK - TABLEVIEW DELEGATE METHOD
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(itemarray[indexPath.row])
        
       
    if  tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark
        {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
    else{
         tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    @IBAction func addBtnPressed(_ sender: UIBarButtonItem) {
        var textfield = UITextField()
        let alert = UIAlertController(title: "add new item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            print("success")
            print(textfield.text!)
            if textfield.text != ""{
            self.itemarray.append(textfield.text!)
            }
            self.userdefault.set(self.itemarray, forKey: "ToDoListArray")
            
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextfield) in
            alertTextfield.placeholder = "Create new item"
           textfield = alertTextfield
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    
}

