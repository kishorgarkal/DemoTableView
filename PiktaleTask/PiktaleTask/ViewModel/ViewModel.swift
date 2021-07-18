//
//  ViewModel.swift
//  PiktaleTask
//
//  Created by MYGENOMEBOX INDIA on 17/07/21.
//

import UIKit

class ViewModel: NSObject {
    static var shareInstance = apiService()
    //MARK: - get data from APi and pass to viewcontroller
    
    func fetchItems(fileName:String,completion: @escaping (_ List: JSON, _ error: Error?) -> Void) {
        ViewModel.shareInstance.getListOffline(fileName: fileName) { [weak self] (list, error) in
         

            do {
                completion(list, nil)
            } catch {
                completion([], error)
            }
        }
    }
}
