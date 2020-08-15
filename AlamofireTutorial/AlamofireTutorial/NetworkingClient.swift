//
//  NetworkingClient.swift
//  AlamofireTutorial
//
//  Created by Jh's Macbook Pro on 2020/08/16.
//  Copyright © 2020 전지훈. All rights reserved.
//

import Foundation
import Alamofire

class NetworkingClient{
    
    typealias WebServiceResponse = ([[String: Any]]?, Error?) -> Void
    
    func execute(_ url : URL, completion: @escaping WebServiceResponse ){
        
        
        AF.request(url).validate().responseJSON{ response in
            switch response.result{
            case.success(let value):
                if let jsonArray = value as? [[String : Any]]{
                    completion(jsonArray, nil)
                }else if let jsonDict = value as? [String : Any]{
                    completion([jsonDict], nil)
                }
            case.failure(let error) :
                completion(nil, error)
            }
        }
        
    }
    
}
