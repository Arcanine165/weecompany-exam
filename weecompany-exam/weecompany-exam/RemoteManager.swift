//
//  RemoteManager.swift
//  weecompany-exam
//
//  Created by Victor Perez on 11/05/24.
//

import Foundation

final class RemoteManager{
    static private let url : String = Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as! String
    
    
    static func setRequest<T: Codable>(type: T.Type, endpoint : Endpoint, param : String? = nil, httpMethod : String, completion : @escaping (Result<T,NetworkError>)->Void){
        guard let request = createRequest(endpoint: endpoint, param: param, httpMethod: httpMethod) else {
            completion(.failure(NetworkError.urlError))
            return
        }
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(NetworkError.urlError))
                return
            }
            let httpResponse = response as? HTTPURLResponse
            if let code =  httpResponse?.statusCode, code >= 400 {
                completion(.failure(NetworkError.httpError))
            }
            do{
                let response = try JSONDecoder().decode(T.self, from: data)
                completion(.success(response))
            }catch{
                print(error)
                completion(.failure(NetworkError.canNotParseData))
            }
        }.resume()
        
        
    }
    static private func createRequest(endpoint : Endpoint, param : String? = nil, httpMethod : String)->URLRequest?{
        guard var components = URLComponents(string: url + endpoint.rawValue + (param ?? "")) else {
            return nil
        }
        let headers : [String:String] =  [ "Content-Type": "application/json"]
       
        
        guard let url = components.url else {
            return nil
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod
        urlRequest.allHTTPHeaderFields = headers
        print("URL:\(urlRequest.url?.absoluteString) httpMethod : \(urlRequest.httpMethod)")
        return urlRequest
    }
}

enum NetworkError : Error {
    case urlError
    case canNotParseData
    case httpError
}

enum Endpoint : String {
    case all = "all"
}

