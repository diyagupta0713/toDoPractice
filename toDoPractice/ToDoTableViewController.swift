//
//  ToDoTableViewController.swift
//  toDoPractice
//
//  Created by Diya Gupta on 8/2/21.
//

import UIKit

class ToDoTableViewController: UITableViewController {

    var toDos: [ToDoCD] = []
     
     func getToDos() {
       if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
          if let coreDataToDos = try? context.fetch(ToDoCD.fetchRequest()) as? [ToDoCD] {
     
                  toDos = coreDataToDos
                  tableView.reloadData()
              
          }

       }
     }
     override func viewWillAppear(_ animated: Bool) {
       getToDos()
     }
    
    override func viewDidLoad() {
        super.viewDidLoad()
          

       
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
    }
    
    func createToDos() -> [ToDo] {
        let swift = ToDo()
        swift.name = "Learn Swift"
        swift.important = true
        
        let read = ToDo()
        read.name = "Read a Book"
        read.important = true
        
        let dishes = ToDo ()
        dishes.name = "Wash Dishes"
        
        return [swift, read, dishes]
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"reuseIdentifier", for: indexPath)

        let toDo = toDos[indexPath.row]
     
     if let name = toDo.name {
     
        if toDo.important {
            cell.textLabel?.text = "❗️" + name
        }
        
        else {
            cell.textLabel?.text = toDo.name
        }
     }
        return cell
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     if let addVC = segue.destination as? AddToDoViewController {
     addVC.previousVC = self
    }
     if let completeVC = segue.destination as? CompleteToDoViewController {
         if let toDo = sender as? ToDoCD {
           completeVC.selectedToDo = toDo
           completeVC.previousVC = self
         }
       }
    }
     override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

       // this gives us a single ToDo
       let toDo = toDos[indexPath.row]

       performSegue(withIdentifier: "moveToComplete", sender: toDo)
     }


}

