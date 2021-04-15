//
//  RequestInterceptor.swift
//  bootcampreto
//
//  Created by nickthewitcher on 4/14/21.
//  Creamos un interceptor para añadir el bearer Token a nuestras llamadas http

import Foundation
import Alamofire
protocol AccessTokenStorage: class {
    typealias JWT = String
    var accessToken: JWT { get set }
}
final class RequestInterceptor: Alamofire.RequestInterceptor {

    private let storage: AccessTokenStorage

    
    init(storage: AccessTokenStorage) {
        self.storage = storage
    }

    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        guard urlRequest.url?.absoluteString.hasPrefix("http://35.192.80.171") == true else {
            /// If the request does not require authentication, we can directly return it as unmodified.
            return completion(.success(urlRequest))
        }
        var urlRequest = urlRequest

        /// Set the Authorization header value using the access token.
        urlRequest.setValue("Bearer " + storage.accessToken, forHTTPHeaderField: "Authorization")

        completion(.success(urlRequest))
    }

   /*
    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        guard let response = request.task?.response as? HTTPURLResponse, response.statusCode == 401 else {
            /// The request did not fail due to a 401 Unauthorized response.
            /// Return the original error and don't retry the request.
            return completion(.doNotRetryWithError(error))
        }

        refreshToken { [weak self] result in
            guard let self = self else { return }

            switch result {
            case .success(let token):
                self.storage.accessToken = token
                /// After updating the token we can safely retry the original request.
                completion(.retry)
            case .failure(let error):
                completion(.doNotRetryWithError(error))
            }
        }
    }
    
    */
}
