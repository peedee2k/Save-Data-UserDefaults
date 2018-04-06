//
//  SecondVC.swift
//  Save data UserDefaults
//
//  Created by Pankaj Sharma on 4/5/18.
//  Copyright © 2018 Pankaj Sharma. All rights reserved.
//

import UIKit

protocol MyProtocol {
    func saveWebLink(title: String, url: String)
}

class SecondVC: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var myTextField: UITextField!
    var delegate: MyProtocol?
    var myURLString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://www.google.com")
        webView.loadRequest(URLRequest(url: url!))
        
        
      
    }
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    

    @IBAction func saveButton(_ sender: Any) {
        
        
            let alert = UIAlertController(title: "Add Bookmark", message: "Customize your weblink", preferredStyle: .alert)
            
            alert.addTextField { (textField: UITextField) in
                textField.placeholder = "Type your page name"
            }
            
            alert.addAction(UIAlertAction(title: "Save", style: .default) { (showAlert) in
                
                if let textfield = alert.textFields?.first {
                    self.delegate?.saveWebLink(title: textfield.text!, url: self.myURLString)
                }
            })
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
      
        
   
    
}
