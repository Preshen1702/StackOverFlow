//
//  BaseNetworkLayer.swift
//  SOFNetworkKit
//
//  Created by Preshen Naidoo on 2021/10/20.
//

import Foundation

public typealias NetworkLayerSuccessResponseBlock = (_ model: Data) -> Void
public typealias NetworkLayerFailureResponseBlock = (_ error: Error?) -> Void

public class BaseNetworkLayer: NSObject {
    
    public func post(searchString: String,
                                 success : @escaping NetworkLayerSuccessResponseBlock,
                                 failure : @escaping NetworkLayerFailureResponseBlock) {
        let link = "https://api.stackexchange.com/2.2/questions?pagesize=20&order=desc&sort=activity&tagged=\(searchString)%203&site=stackoverflow&filter=withbody"
        let url = URL(string : link)!
        let session = URLSession.shared
        
        session.dataTask(with: url) { (data, response, error) in
            if response == nil {
                failure(error)
            } else {
                if let data = data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: [])
                        print(json)
                    success(data)
                    }
                    catch {
                        failure(error)
                    }
                }
            }
        }.resume()
    }
}
