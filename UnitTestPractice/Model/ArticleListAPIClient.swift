//
//  ArticleListAPIClient.swift
//  UnitTestPractice
//
//  Created by 星優大 on 2023/03/16.
//

import Foundation

class ArticleListAPIClient: ArticleListAPIClientProtocol {
    
    func fetch(completion: @escaping ((Result<[Article], APIError>) -> Void)) {
        guard let url = URL(string: "https://qiita.com/api/v2/items") else {
            return  completion(.failure(.invalidURL))
        }
        // URL型に変換
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { (data, response, error) in

            do {
                guard let data = data else { throw APIError.noneValue }
                guard let articleList = try? JSONDecoder().decode([Article].self, from: data) else {
                    throw APIError.noneValue
                }
                DispatchQueue.main.async {
                    completion(.success(articleList))
                }
            } catch {
                /*
                 * ① as?でAPIError型にダウンキャストしている
                 *    - 成功した場合：Optional型でラッピングされる
                 *    - 失敗した場合：nil
                 *
                 */
                if error as? APIError == APIError.networkError {
                    completion(.failure(.networkError))
                } else if error as? APIError == APIError.noneValue {
                    completion(.failure(.noneValue))
                } else {
                    completion(.failure(.unknown))
                }
            }
        }.resume()
    }
}
