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
    
    var dataUsers: UserDelegate?
    var dataTweets: TweetDelegate?
    var conDel: ConnectionDelegate?
    
    init(delegate: UserDelegate) {
        self.dataUsers = delegate
    }
    
    init(delegate: TweetDelegate) {
        self.dataTweets = delegate
    }
    
    init(delegate: ConnectionDelegate) {
        self.conDel = delegate
    }
    
    func connectService(baseUrl: String, method: HTTPMethod, header: Dictionary<String, String>, body: Any?) {
        
        request(baseUrl, method: method, parameters: nil, encoding: JSONEncoding.default, headers: header).responseJSON{ response in
            
            switch response.result {
            case .success( _): do {
                self.conDel?.successConnection(response: response.data!)
               
                
            } catch { self.conDel?.errorConnection(message: "bir sorun oluştu")}
                
            case .failure(let error): do {
                
                self.conDel?.errorConnection(message: error.localizedDescription)
                
                }
                
            }
        }
    }
    
    func getAllUsers() {
        let headers = ["Content-Type":"application/json"]
        request("http://localhost:3000/users", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseJSON{ response in
            
            switch response.result {
            case .success( _): do {
                
                let responseModel = try JSONDecoder().decode([User].self, from: response.data!)
                self.dataUsers?.getUsers(userList: responseModel)
                
            } catch { print(error)}
                
            case .failure(let error): do {print(error)}
                
            }
        }
    }
    
    func getTweetById(id: Int) {
        let headers = ["Content-Type":"application/json"]
        request("http://localhost:3000/tweets/\(id)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseJSON{ response in
            
            switch response.result {
            case .success( _): do {
                
                let responseModel = try JSONDecoder().decode(Tweet.self, from: response.data!)
                self.dataTweets?.getTweet(tweet: responseModel)
                
            } catch { print(error)}
                
            case .failure(let error): do {print(error)}
                
            }
        }
    }
}

