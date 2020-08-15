//
//  ViewController.swift
//  AlamofireTutorial
//
//  Created by Jh's Macbook Pro on 2020/08/16.
//  Copyright © 2020 전지훈. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var executeRequest: UIButton!
    
    private let networkingClient = NetworkingClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        executeRequest.addTarget(self, action: #selector(btnEvent), for: .touchUpInside)
    }

    @objc func btnEvent(){
        guard let urlToExecute = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            return
        }
        networkingClient.execute(urlToExecute){(json, error) in
            if let error = error{
                self.textView.text = error.localizedDescription
            }else if let json = json {
                self.textView.text = json.description
            }
        }
    }
}

