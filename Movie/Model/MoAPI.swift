//
//  Utils.swift
//  Movie
//
//  Created by Pierre Perrin on 17/02/2018.
//  Copyright © 2018 PierrePerrin. All rights reserved.
//


/// Structure for Api calls (Helps to get the ApiKey and hosturl)
struct MoAPI{
    
    let apiKeyKey:String?
    let apiKey: String?
    let hostUrl: String
    
    /// Uses the Api parameters to make the http req
    ///
    /// - Parameters:
    ///   - path: The request's path
    ///   - method: HTTPMethod
    ///   - parameters: Request parameters
    ///   - useApiKey: is API_Key needed
    ///   - headers: Request's headers (Optional)
    func request(withPath path: String,
                     method:HTTPMethod = .get,
                     parameters:Parameters,
                     useApiKey:Bool=true,
                     headers: HTTPHeaders? = nil) -> Request{
        
        let url = self.hostUrl + path
        var parameters = parameters
        
        //Check and add the apiKey if needed
        if let apiKey = self.apiKey,
            let key = self.apiKeyKey,
            useApiKey
        {
            parameters[key] = apiKey
        }
        
        //Uses Alamofire to perform the request
        let request = Alamofire.request(url, method: method, parameters: parameters, headers: headers)
        return request
    }
}
