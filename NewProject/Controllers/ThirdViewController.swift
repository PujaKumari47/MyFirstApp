//
//  ThirdViewController.swift
//  NewProject
//
//  Created by Puja Kumari on 3/23/17.
//  Copyright © 2017 nineleaps. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Lottie


class ThirdViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var moneyListArray: [UserMapper] = [UserMapper]()
    
    
    @IBOutlet weak var dressTableView: UITableView!
    
    var numbersDress = ["tops","kurta","saree","suit","Lehenga"]
    var i:Int = 0
    var j = 0
    var response : JSON = nil
    var user : [User] = []
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getAmountFromServer()
        
//        let url = NSURL(string: "http://jsonplaceholder.typicode.com/users")
//        var  request = URLRequest(url: url! as URL)
//        request.httpMethod = "GET"
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        Alamofire.request(request).responseJSON { response in
//    
//            switch response.result {
//             
//            case .success(let data):
//                self.dressTableView.delegate = self
//                self.dressTableView.dataSource = self
//                self.response = JSON (data)
//                
//                for i in 0..<self.response.count {
//                    let singleUser = User(userJson:self.response[i])
//                    self.user.append(singleUser)
//                    
//                }
//                
//                
//                
//                
//            print (data)
//                
//                
//            case.failure(let error):
//                print("error",error)
//                
//                
//            }
        
        
        }
        
        func getAmountFromServer() {
            
           
            NetworkManager.sharedInstance.getMoney(completion: { (response) in
                switch response.result {
                case .Success:
                    if let responseValue = response.result.value as? NSDictionary {
                        if let status = responseValue["status"] as? String {
                            if status == "success" {
                                
                                 if let data = responseValue["data"] as? NSArray {
                                    if let AmountList = Mapper<UserMapper>().mapArray(data) {
                                    self.moneyListArray = AmountList
                                    self.dressTableView.delegate = self
                                    self.dressTableView.dataSource = self
                                    self.dressTableView.reloadData()
                                    
                                }
                            }
                            }
                        }else {
                            
                        }
                    }
                    break
                case .Failure(_): break
                    
                }
            })
        }
        
        
    

    
   // TableView delegate and data source Methods
     func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return moneyListArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "TableViewCell"
        let cell = self.dressTableView.dequeueReusableCell(withIdentifier: cellIdentifier,
                                                           for: indexPath) as! TableViewCell
        cell.dressImageView.image = UIImage(named: "summerDress")
        let myUser = self.moneyListArray[indexPath.row]
        
        cell.descriptionLabel.text = myUser.name
        cell.emailLabel.text = String(myUser.id)
        
     
        
                
        
        return cell
        
    }
    
    
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
     
    }
    

  

}

