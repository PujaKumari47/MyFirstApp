//
//  User.swift
//  NewProject
//
//  Created by Puja Kumari on 4/11/17.
//  Copyright © 2017 nineleaps. All rights reserved.
//

import Foundation
import SwiftyJSON


class User {
    
    var name:String
    var email:String
    var id:String
    var address: Address
    
    
    init(userJson:JSON) {
        self.name = userJson ["name"].stringValue
        self.email = userJson["email"].stringValue
        self.id = userJson["id"].stringValue
        self.address = Address(addressJson: userJson["address"])
    }
    
    
    
    
    
    
    
    
    
}
class Address {
    var street:String
    var city:String
    
    
    
    init(addressJson:JSON) {
        self.street = addressJson ["street"].stringValue
        self.city = addressJson ["city"].stringValue
        

    
}
}
