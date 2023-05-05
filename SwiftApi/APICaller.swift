//
//  APICaller.swift
//  SwiftApi
//
//  Created by dinh.nguyen.18 on 04/05/2023.
//

import Foundation

final class APICaller {
    static let shared = APICaller()
    
    struct Constains {
       static let topHeadlinesURL = URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=5fe48c17fe9b4af883ca4ab6e858e81b")
    }
    
    private init(){
        
    }
    
    public func getTopStory(completion: @escaping (Result<[String], Error>) -> Void){
        guard let url = Constains.topHeadlinesURL else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            else if let data = data {
                do {
                    let result = try JSONDecoder().decode(APIResponse.self, from: data)
                    print("Articles \(result.articles.count)")
                }
                catch {
                    completion(.failure(error))
                }
            }
        }
        
        task.resume()
    }
}


// Models

struct APIResponse: Codable {
    let articles: [Articles]
}


struct Articles: Codable {
    let source: Source
    let title: String
    let description: String
    let url: String
    let urlToImage: String
    let publishedAt: String
}

struct Source: Codable {
    let name: String
}

