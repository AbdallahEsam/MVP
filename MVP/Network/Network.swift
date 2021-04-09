//
//  Network.swift
//  MVP
//
//  Created by Abdallah Esam on 4/9/2021.
//  Copyright © 2021 Abdallah Esam. All rights reserved.
//

import Alamofire

typealias NetworkCompletion<T> = (AppResponse<T>) -> ()

protocol NetworkProtocol {
    func request<T>(_ request: URLRequestConvertible, decodeTo type: T.Type, completionHandler: @escaping NetworkCompletion<T>) where T: BaseCodable
    func upload<T>(_ request: URLRequestConvertible, data: [UploadData], decodedTo type: T.Type, completionHandler: @escaping NetworkCompletion<T>) where T: BaseCodable
    func cancelAllRequests()
}

class Network {
    
    fileprivate let requestRetrierMiddleware = RequestRetrierMiddleware()
    fileprivate let requestAdapterMiddleware = RequestAdapterMiddleware()
    
    fileprivate lazy var session: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = HTTPHeaders.default.dictionary
        configuration.timeoutIntervalForResource = 60
        configuration.timeoutIntervalForRequest = 60
        let interceptor = Interceptor(adapter: requestAdapterMiddleware, retrier: requestRetrierMiddleware)
        let session = Session(configuration: configuration, interceptor: interceptor)
        return session
    }()
    
    fileprivate func filterError(error:AFError)->AppError{
        
        if let underlyingError = error.underlyingError {
            if let urlError = underlyingError as? URLError {
                switch urlError.code {
                case .timedOut:
                    print("Timed out error")
                    return .timeOut
                case .notConnectedToInternet:
                    print("Not connected")
                    return .noInternet
                default:
                    //Do something
                    print("Unmanaged error")
                    return .error(error.localizedDescription)
                }
            }
        }
        return .error(error.localizedDescription)
    }
    
    fileprivate func process<T>(response: AFDataResponse<Any>, decodedTo type: T.Type) -> AppResponse<T> where T : BaseCodable  {
        
        switch response.result {
        case .success:
            
            switch response.response?.statusCode {
            case 401:
                return AppResponse.error(AppError.cannotDecode)
            case 500:
                return AppResponse.error(AppError.internalServerError)
            default:
                guard let data = response.data else {
                    return AppResponse.error(.internalServerError)
                }
                #if DEBUG
                print("*************$$$$$$$$$*************")
                print(SwiftyJSON(response.value ?? [:]))
                print("*************$$$$$$$$$*************")
                #endif
                
                do {
                    let data = try JSONDecoder.decodeFromData(type, data: data)
                    if data.isSuccess {
                        return .success(data)
                    }else{
                        return .error(.error(data.message ?? ""))
                    }
                } catch {
                    #if DEBUG
                    debugPrint(error)
                    #endif
                    return AppResponse.error(AppError.cannotDecode)
                }
            }
            
        case .failure(let error):
            #if DEBUG
            print(error)
            debugPrint("#DEBUG#", error.localizedDescription)
            #endif
            return AppResponse.error(filterError(error: error))
        }
    }
    
    
    func cancelAllRequests() {
        session.cancelAllRequests()
    }
}

extension Network: NetworkProtocol {
    func request<T>(_ request: URLRequestConvertible, decodeTo type: T.Type, completionHandler: @escaping NetworkCompletion<T>) where T : BaseCodable {
        #if DEBUG
        print(SwiftyJSON(request.parameters ?? [:]))
        #endif
        session
            .request(request)
            .responseJSON {[weak self] response in
                guard let self = self else { return }
                completionHandler(self.process(response: response, decodedTo: type))
            }
            .responseString(completionHandler: { response in
                // print(String(data: response.data ?? Data(), encoding: .utf16) ?? "")
            })
    }
    
    func upload<T>(_ request: URLRequestConvertible, data: [UploadData], decodedTo type: T.Type, completionHandler: @escaping NetworkCompletion<T>) where T : BaseCodable {
        #if DEBUG
        print(SwiftyJSON(request.parameters ?? [:]))
        #endif
        session
            .upload(multipartFormData: { multipartFormData in
                data.forEach {
                    multipartFormData.append($0.data, withName: $0.name, fileName: $0.fileName, mimeType: $0.mimeType)
                }
                
                for (key, value) in request.parameters ?? [:] {
                    multipartFormData.append("\(value)".data(using: .utf8)!, withName: key)
                }
            }, with: request)
            .responseJSON {[weak self] response in
                guard let self = self else { return }
                completionHandler(self.process(response: response, decodedTo: type))
            }
            .responseString(completionHandler: { response in
                // print(String(data: response.data ?? Data(), encoding: .utf16) ?? "")
            })
            .uploadProgress { (progress) in
                #if DEBUG
                print(String(format: "%.1f", progress.fractionCompleted * 100))
                #endif
            }
    }
    
    
    
}
