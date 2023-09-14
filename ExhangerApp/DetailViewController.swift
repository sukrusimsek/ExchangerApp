//
//  DetailViewController.swift
//  ExhangerApp
//
//  Created by Şükrü Şimşek on 11.09.2023.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        let currency = list[indexPath.row]
        cell.label.text = "\(currency.code): \(currency.value)"
        cell.img.image = UIImage(named: currency.image)
        
        if let img = UIImage(named: currency.image) {
            cell.img.image = img
        }else {
            cell.img.image = UIImage(named: "coinpng.png")
            }
        
        return cell
    }
    
    
    var list = [Currency]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        getData()
        
    }
    func getData() {
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=4a990ae1cc0ef5a920e4c7e9eeb1123c")
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url!) {( data, response, error) in
            if error != nil {
                print(error?.localizedDescription)}
            else {
                if data != nil{
                    do{
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!,options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any> //Ne işe yaradığını gpt ye sor
                        
                        print(jsonResponse)
                        
                        DispatchQueue.main.async {
                            
                            let array = Array(jsonResponse["rates"] as! [String : Any])
                            
                            for (key, value) in array{
                                var entity = Currency()
                                entity.code = key
                                entity.value = value as! Double
                                self.list.append(entity)
                                
                            }
                            print(self.list.count)
                            self.tableView.reloadData()
                        }
                    } catch {
                        print("Error")
                    }
                }
            }
        }
        task.resume()
    }


}
