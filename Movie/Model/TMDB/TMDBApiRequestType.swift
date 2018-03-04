//
//  TMDBApiManager.swift
//  Movie
//
//  Created by Pierre Perrin on 18/02/2018.
//  Copyright © 2018 PierrePerrin. All rights reserved.
//

class TMDBApiRequestType : NSObject{
    
    required override init() {
        super.init()
    }
    
    var responseObjectType : TMDBObject.Type {
        return TMDBObject.self
    }
    
    var responseKey : String{
        return "results"
    }
    
    var path : String{
        return ""
    }
    
    var language : String{
        return Locale.current.identifier
    }
    
    /// perform the api request
    ///
    /// - Parameters:
    ///   - parameters: the requests parameters
    ///   - completion: completion handler
    func performRequest(parameters : Parameters? = nil,completion:(() -> Void)? = nil){
        
        var parameters = parameters ?? Parameters.init()
        parameters["language"] = self.language
        
        let request = TMDBApiManager.default.api.request(withPath: self.path, parameters: parameters)
        request.responseJSON {(response) in
            
            var errorRecieved = ""
            
            if let value = response.value{
                self.computeResponse(response:value, completion: completion)
                return
            }else if let error = response.error{
                errorRecieved = error.localizedDescription
            }else{
                errorRecieved = "An unexpected error occured..."
            }
            NSLog("##Type: %@\nAN ERROR OCCURED in request: %@\n", self.description, errorRecieved)
            completion?()
        }
    }
    
    func computeResponse(response:Any?,completion:(() -> Void)? = nil){
        
        guard let response = (response as? [String:Any]) else{
            completion?()
            return
        }
        
        if var values = response[responseKey]{
            
            if !(values is [Any]){
                values = [values]
            }
            
            let realm = MoRealmManager.default.realm
            for value in (values as? [Any]) ?? []{
                
                realm?.beginWrite()
                let _ = realm?.create(self.responseObjectType, value: value, update: true)
                
                do{try realm?.commitWrite()}
                catch{ NSLog("##Realm Error %@\n",error.localizedDescription) }
            }
        }else{
            NSLog("##Any values for key: %@ \n Response: %@\n",self.description,responseKey, response)
        }
        
        completion?()
    }
}

