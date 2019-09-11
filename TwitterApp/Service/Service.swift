//
//  Service.swift
//  TwitterApp
//
//  Created by Ahmet Tuztașı on 05/09/2019.
//  Copyright © 2019 Ahmet Tuztașı. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class Service {
    
    var conDel: ConnectionDelegate?
    
    init(delegate: ConnectionDelegate) {
        self.conDel = delegate
    }
    
    func connectService(baseUrl: String, method: HTTPMethod, header: Dictionary<String, String>, body: Any?) {
        
        request(baseUrl, method: method, parameters: nil, encoding: JSONEncoding.default, headers: header).responseJSON{ response in
            
            switch response.result {
            case .success( _): do {
                self.conDel?.successConnection(response: response.data!)
            }
                
            case .failure( _): do {
                self.conDel?.errorConnection(message: "Bağlantı gerçekleştirelemedi")
                }
            }
        }
    }
}

