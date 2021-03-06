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
    var password_confirmation = String()
    
    var idArray = [Int]()
    var nameArray = [String]()
    var emailArray = [String]()
    
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
        
        let params: [String: String] = [
            "name" : self.name,
            "email" : self.email,
            "password" : self.password,
            "password_confirmation" : self.password_confirmation
        ]
        
        
        AF.request(encodeUrlString, method: .post, parameters: params, encoder: URLEncodedFormParameterEncoder.default).response { response in

            switch response.result {

            case .success:
                print("成功")
                break
            case .failure(_):
                break
            }
        }
        
    }
}

