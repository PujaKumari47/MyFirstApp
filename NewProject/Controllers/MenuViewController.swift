//
//  MenuViewController.swift
//  NewProject
//
//  Created by Puja Kumari on 3/22/17.
//  Copyright © 2017 nineleaps. All rights reserved.
//

import UIKit



protocol SlideMenuDelegate {
    func slideMenuItemSelectedAtIndex(_ index : Int32)
}


class MenuViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var MenuOptionsTableView: UITableView!
    
    @IBOutlet weak var closeImageView: UIImageView!
    
    /**
     *  Array containing menu options
     */
    var arrayMenuOptions = [Dictionary<String,String>]()
    
    /**
     *  Menu button which was tapped to display the menu
     */
    var btnMenu : UIButton!
    
    /**
     *  Delegate of the MenuVC
     */
    var delegate : SlideMenuDelegate?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.MenuOptionsTableView.delegate = self
        self.MenuOptionsTableView.dataSource = self
        closeImageView.isUserInteractionEnabled = true
        var tapGestureRecognizer = UITapGestureRecognizer(target: self, action: "imageTapped:")
        closeImageView.addGestureRecognizer(tapGestureRecognizer)

       
    }
    
    
    func updateArrayMenuOptions(){
        arrayMenuOptions.append(["title":"Home", "icon":"home_icon"])
        arrayMenuOptions.append(["title":"VirtualCard", "icon":"demo_icon"])
        
        MenuOptionsTableView.reloadData()
    }
    
    func imageTapped(sender: UITapGestureRecognizer) {
        btnMenu.tag = 0
        
        if (self.delegate != nil) {
            var index = Int32(btnMenu.tag)
            if(btnMenu == self.closeImageView){
                index = -1
            }
            delegate?.slideMenuItemSelectedAtIndex(index)
        }
        
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            self.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width,height: UIScreen.main.bounds.size.height)
            self.view.layoutIfNeeded()
            self.view.backgroundColor = UIColor.clear
        }, completion: { (finished) -> Void in
            self.view.removeFromSuperview()
            self.removeFromParentViewController()
        })
       
    }
    
    
    
    
    //TableView delegate and datSource Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
     
}

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return arrayMenuOptions.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60 
    }
    
    
    
  
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "menuOptionsCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        return cell
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

   

}
