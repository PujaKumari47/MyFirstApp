//
//  ThirdViewController.swift
//  NewProject
//
//  Created by Puja Kumari on 3/23/17.
//  Copyright © 2017 nineleaps. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var dressTableView: UITableView!
    
    var numbersDress = ["tops","kurta","saree","suit","Lehenga"]
    var i:Int = 0
    var j = 0
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dressTableView.delegate = self
        self.dressTableView.dataSource = self
        //self.addSlideMenuButton()

       
    }
    
   // TableView delegate and data source Methods
     func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "TableViewCell"
        let cell = self.dressTableView.dequeueReusableCell(withIdentifier: cellIdentifier,
                                                           for: indexPath) as! TableViewCell
        cell.dressImageView.image = UIImage(named: "summerDress")
        
        cell.descriptionLabel.text = numbersDress[0]
        
        
        
        
        return cell
        
    }
    
    
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
     
    }
    

  

}
