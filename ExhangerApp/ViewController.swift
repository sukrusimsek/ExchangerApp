//
//  ViewController.swift
//  ExhangerApp
//
//  Created by Şükrü Şimşek on 10.09.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true //Üst kısımda yer alana navigation cont. ı gizlemeye yarar
        
        
        
    }
}

