//
//  DetailController.swift
//  RealmDemo
//
//  Created by AnhTT on 8/3/20.
//  Copyright © 2020 AnhTT. All rights reserved.
//

import UIKit
import RealmSwift

class DetailController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    

    @IBOutlet weak var tableView: UITableView!
    var realm: Realm!
    var objectArray: Results<Model>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if let realm = try? Realm() {
            objectArray = realm.objects(Model.self)
            tableView.reloadData()
        }
        print(Realm.Configuration.defaultConfiguration.fileURL)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objectArray!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? DetailTableViewCell else {
            return UITableViewCell()
        }
        let item = objectArray?[indexPath.row]
        cell.textLabel?.text = item?.name
        
        //action khi cham vao tableView (outside) cell
        let tap = UITapGestureRecognizer(target: self, action: #selector(tableTapped))
        self.tableView.backgroundView = UIView()
        self.tableView.backgroundView?.addGestureRecognizer(tap)
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let item = objectArray?[indexPath.row]
            
            if let realm = try? Realm() {
                
                try! realm.write {
                    realm.delete(item!)
                }
            }
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let indexPath = tableView.indexPathForSelectedRow {
            
        } else {
            print("An61 ra")
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("didDeselectRowAt")
        
    }
    @objc func tableTapped() {
        print("tableTapped")
        tableView.isHidden = true
    }
    // MARK: Action
    
    @IBAction func onTapButton(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "AddVC") as! AddVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
