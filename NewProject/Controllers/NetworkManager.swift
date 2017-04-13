//
//  NetworkManager.swift
//  NewProject
//
//  Created by Puja Kumari on 4/12/17.
//  Copyright © 2017 nineleaps. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire
import ObjectMapper
import AlamofireObjectMapper


class NetworkManager {
    
    internal typealias CompletionHandler = (_ response: Alamofire.Response<AnyObject, NSError>) -> Void

    //shared instance
    static let sharedInstance = NetworkManager()
    
    
    
    
    /**
     Api call for get money response
     
     - parameter url:        url of endpoint
     - parameter completion: completion closure
     */
    func getMoney(completion: CompletionHandler) {
        let header = ["authorization": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySW5mbyI6IjU4YzYzYjA5MDE1NWFlMDk2MDNkZTBjMyIsImlhdCI6MTQ4OTM5NzQ5OX0.SfbNkY78CgOAHz8sHSVYrgHpG5zZnp-GgLddgj-LsO8"]
        let moneyUrl = kMoneyUrl
        Alamofire.request(.GET, moneyUrl, parameters: nil, encoding: .JSON,header:header)
            .responseJSON { (response) in
                completion(response: response)
        }
    }
    
    
    
    
    
    
    
    
    
    
}
