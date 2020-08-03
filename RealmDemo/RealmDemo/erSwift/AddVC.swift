//
//  AddVC.swift
//  RealmDemo
//
//  Created by AnhTT on 8/3/20.
//  Copyright © 2020 AnhTT. All rights reserved.
//

import UIKit
import RealmSwift

class AddVC: UIViewController {
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    let item = Model()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func addNew() {
        if let name = myTextField.text {
            item.name = name
            if let realm = try? Realm() {
                try! realm.write {
                    realm.add(item)
                }
                navigationController?.popViewController(animated: true)
            }
        }
    }
    
    @IBAction func ActionAdd(_ sender: Any) {
        addNew()
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
