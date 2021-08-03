//
//  ToDoTableViewController.swift
//  toDoPractice
//
//  Created by Diya Gupta on 8/2/21.
//

import UIKit

class ToDoTableViewController: UITableViewController {

    var toDos: [ToDo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        toDos = createToDos()
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

        if toDo.important {
            cell.textLabel?.text = "!" + toDo.name
        }
        
        else {
            cell.textLabel?.text = toDo.name
        }
        
        return cell
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }


}
//added a button to test commit
