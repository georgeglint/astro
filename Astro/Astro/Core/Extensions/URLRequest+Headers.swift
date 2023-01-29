//
//  URLRequest+Headers.swift
//  Astro
//
//  Created by George Leadbeater on 29/01/2023.
//

import Foundation

extension URLRequest {
    // MARK: - Public Methods
    
    func acceptingJSON() -> URLRequest {
        addHeaderToRequest(field: "Accept", value: "application/json")
    }
    
    // MARK: - Private Methods
    
    private func addHeaderToRequest(field: String, value: String) -> URLRequest {
        var request = self
        request.setValue(value, forHTTPHeaderField: field)
        return request
    }
}
