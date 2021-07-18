//
//  apiService.swift
//  BitcoinTicker
//
//  Created by Kishor Garkal on 10/07/21.
//

import UIKit

class apiService: NSObject {
    static var shareInstance = apiService()
    
    //MARK: -  URL Requests
    func getListOffline(fileName:String,completion: @escaping (_ List: JSON, _ error: Error?) -> Void) {
        
        guard let filePath = Bundle.main.url(forResource: fileName,
                                             withExtension: "json") else {
            completion([], AppError.fileNotFound)
            return
        }

        do {
            let data = try Data.init(contentsOf: filePath)
            let json = try JSON(data: data)
            let list: JSON = json
            completion(list, nil)
        } catch {
            completion([], error)
        }
    }
   
}


