//
//  ViewController.swift
//  Save data UserDefaults
//
//  Created by Pankaj Sharma on 4/4/18.
//  Copyright © 2018 Pankaj Sharma. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, MyProtocol {

    @IBOutlet weak var myTextfield: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    var listArray = [MyModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myVC = SecondVC()
        myVC.delegate = self
        if let savedArray = defaults.array(forKey: "newKey") as? [MyModel] {
            listArray = savedArray
        }
        
    }
    // This aap is crashing I think I am using UserDefault func in a delegate method
    
    let defaults = UserDefaults.standard
    @IBAction func sendButton(_ sender: Any) {
        
//         listArray.append(myTextfield.text!)
//        defaults.set(listArray, forKey: "myArrayKey")
//        myTextfield.text = ""
//            tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = listArray[indexPath.row].pageTitle
        return cell
    }
    
   
    
    func saveWebLink(title: String, url: String) {
        let data = MyModel(pageTitle: title, url: url)
        listArray.append(data)
        
        defaults.set(listArray, forKey: "newKey")
        
        tableView.reloadData()
    }
    @IBAction func segueButton(_ sender: Any) {
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Segue" {
            let vc = segue.destination as! SecondVC
            vc.delegate = self
        }
    }
    
}

