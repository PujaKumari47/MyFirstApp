//
//  UserMapper.swift
//  NewProject
//
//  Created by Puja Kumari on 4/13/17.
//  Copyright © 2017 nineleaps. All rights reserved.
//

import Foundation
import ObjectMapper




class UserMapper:Mappable {
    
    var name: String
    var id : Int
    
    
    
    
    required init?(map: Map) {
        self.name = ""
        self.id = 0
    }
    
    
    
    func mapping(map: Map) {
        self.name <- map["label"]
        self.id  <- map["value"]
      
        
    }
    
    
}

