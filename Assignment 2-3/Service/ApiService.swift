//
//  ApiService.swift
//  Assignment 2-3
//
//  Created by ramy on 2022-01-30.
//

import Foundation
import Alamofire
import SwiftyJSON

class ApiService {
    
    static var shared = ApiService()
    
    func getAllLeagues(handler: @escaping ([match])-> Void){
        let urlString = "https://api.football-data-api.com/league-matches?key=test85g57&season_id=2012"
//        let urlObj = URL(string: urlString)!
//        AF.request(with: urlObj) { (data , apiresponse , error) in
//            if let error = error{
//                print(error)
//            }
//            else if let correct_data = data{
//                do {
//                    let decoder = JSONDecoder()
//                    let resultFromDecoder = try? decoder.decode(result.self ,from: correct_data)
//                    handler(resultFromDecoder!.data)
//                }
//            }
//        }.resume()
        
        AF.request(urlString)
          .validate()
          .responseDecodable(of: result.self) { (response) in
            guard let match = response.value else { return }
              print(match.data)
          }
    }
    
 
  
}
