//
//  SwiftUIView.swift
//  UnitTestPractice
//
//  Created by 星優大 on 2023/03/16.
//

import Foundation

class ArticleViewModel: ObservableObject {
    @Published var articles: [Article] = [Article]()
    var apiError: APIError?
    private let articleListAPIClient: ArticleListAPIClientProtocol!

    // テスト用のイニシャライザ
    init(fetchArticlesAPIClient: ArticleListAPIClientProtocol) {
        articleListAPIClient = fetchArticlesAPIClient
        loadArticles()
    }
    init() {
        articleListAPIClient = ArticleListAPIClient()
        loadArticles()
    }

    func loadArticles() {
        articleListAPIClient.fetch(completion: { [weak self] result in
            switch result {
            case .success(let articleList):
                self?.articles = articleList
            case .failure(let error):
                self?.apiError = error
                print(error)
            }


        })
    }
}
