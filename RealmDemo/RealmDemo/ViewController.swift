//
//  ViewController.swift
//  RealmDemo
//
//  Created by AnhTT on 7/31/20.
//  Copyright © 2020 AnhTT. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    let realm = try! Realm() // khởi tạo biến toạn cục realm và nó được dùng xuyên suốt cả class.
    var todoList: Results<TodoItem> { // khai báo lấy gì từ object Realm ra
        get {
            return realm.objects(TodoItem.self)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        cell.textLabel?.text = "1"
        cell.detailTextLabel?.text = "2"
        return cell
    }
    
    @IBAction func addNew(_ sender: Any) {
        let alertController : UIAlertController = UIAlertController(title: "New Todo", message: "What do you plan to do?", preferredStyle: .alert)
        
        alertController.addTextField { (UITextField) in
        
        }
        
        let action_cancel = UIAlertAction.init(title: "Cancel", style: .cancel) { (UIAlertAction) -> Void in
          
        }
        alertController.addAction(action_cancel)
        
        let action_add = UIAlertAction.init(title: "Add", style: .default) { (UIAlertAction) -> Void in
        }
        alertController.addAction(action_add)
        present(alertController, animated: true, completion: nil)
    }
    
}

