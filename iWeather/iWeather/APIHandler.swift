//
//  APIHandler.swift
//  iWeather
//
//  Created by Nick patel on 22/07/21.
//  Copyright © 2021 Nick patel. All rights reserved.
//

import Foundation

class APIHandler {
    
    static let apidata = APIHandler()
    
    func serchData(data:String) -> [FetchData] {
        
        if let path = URL(string: "https://api.weatherapi.com/v1/current.json?key=30020b2563914a8f9f074740212207&q=\(data)") {
        
            do{
                
                let Fdata = try Data(contentsOf: path)
                let decoder = JSONDecoder()
                
                do
                {
                    
                    let weatherData = try decoder.decode(FetchData.self, from: Fdata)
                    return [weatherData]
                    
                }catch{
                    print("Error")
                }
                
            } catch{
                print("Error")
            }
        }
        return [FetchData]()
        }
     
    
}



