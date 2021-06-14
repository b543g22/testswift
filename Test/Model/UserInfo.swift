//
//  UserInfo.swift
//  Test
//
//  Created by koki on 2021/06/04.
//

import Foundation
import SwiftyJSON
import Alamofire

protocol UserInfoProtocol {
    func catcheData()
}

class UserInfo {
    
    var name = String()
    var email = String()
    var password = String()
    var updkbn = String()
    
    var idArray = [Int]()
    var nameArray = [String]()
    var emailArray = [String]()
    var passwordArray = [String]()
    var updkbnArray = [String]()
    
    var userDelegate:UserInfoProtocol?
    
    func SetData(resultCount:Int,encodeUrlString:String) {
        AF.request(encodeUrlString, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON { (response) in
            
            switch response.result {
            
            case .success:
                do {
                    let json:JSON =  try JSON(data: response.data!)
                    for i in 0...resultCount - 1 {
                        if json["data"][i]["name"].string == nil {
                            print("ヒットしませんでした")
                            return
                        }
                        self.idArray.append(json["data"][i]["id"].int!)
                        self.nameArray.append(json["data"][i]["name"].string!)
                        self.emailArray.append(json["data"][i]["email"].string!)
                        self.passwordArray.append(json["data"][i]["password"].string!)
                        self.updkbnArray.append(json["data"][i]["updkbn"].string!)
                    }
                    self.userDelegate?.catcheData()
                } catch  {
                }
                break
            case .failure(_): break
            }
        }
    }
    
    func StoreData(encodeUrlString:String){
        
        let params: Parameters = [
            "name" : self.name,
            "email" : self.email,
            "password" : self.password,
            "updkbn" : "A"
        ]
        
        AF.request(encodeUrlString, method: .post, parameters: params, encoding: JSONEncoding.default).responseJSON { (response) in
            print(response.result)
        }
    }
}
