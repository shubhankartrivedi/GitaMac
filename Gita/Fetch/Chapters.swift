//
//  Chapters.swift
//  Gita
//
//  Created by Shubhankar Trivedi on 25/04/24.
//

import Foundation
func fetchChapters(completion: @escaping (Result<[ChapterModel], Error>) -> Void) {
    guard let url = URL(string: "https://gita.shubhankartrivedi.com/api/v1/chapter/") else {
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

        do {
            // Decode the data into the ChaptersResponse structure
            let decoder = JSONDecoder()
            let chaptersResponse = try decoder.decode(ChaptersResponse.self, from: data)
            completion(.success(chaptersResponse.chapters))
        } catch {
            completion(.failure(error))
        }
    }
    task.resume()
}

