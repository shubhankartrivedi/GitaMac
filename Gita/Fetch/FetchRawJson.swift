//
//  FetchRawJson.swift
//  Gita
//
//  Created by Shubhankar Trivedi on 25/04/24.
//

import Foundation
func fetchRawJSON(from urlString: String, completion: @escaping (Result<String, Error>) -> Void) {
    guard let url = URL(string: urlString) else {
        completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
        return
    }

    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            completion(.failure(error))
            return
        }

        guard let data = data else {
            completion(.failure(NSError(domain: "", code: -2, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
            return
        }

        if let rawJSON = String(data: data, encoding: .utf8) {
            completion(.success(rawJSON))
        } else {
            completion(.failure(NSError(domain: "", code: -3, userInfo: [NSLocalizedDescriptionKey: "Data decoding error"])))
        }
    }
    task.resume()
}

func formatJSONString(_ jsonString: String) -> Result<String, Error> {
    guard let jsonData = jsonString.data(using: .utf8) else {
        return .failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid input string"]))
    }

    do {
        let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: [])
        let formattedData = try JSONSerialization.data(withJSONObject: jsonObject, options: [.prettyPrinted])
        if let formattedString = String(data: formattedData, encoding: .utf8) {
            return .success(formattedString)
        } else {
            return .failure(NSError(domain: "", code: -2, userInfo: [NSLocalizedDescriptionKey: "Failed to encode formatted JSON"]))
        }
    } catch {
        return .failure(error)
    }
}
