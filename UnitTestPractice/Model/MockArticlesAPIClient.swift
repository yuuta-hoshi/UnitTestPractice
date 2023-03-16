//
//  MockArticlesAPIClient.swift
//  UnitTestPracticeTests
//
//  Created by 星優大 on 2023/03/17.
//

class MockArticlesAPIClient: ArticleListAPIClientProtocol {
    
    var returnArticles: [Article]?
    lazy var fetchResult: Result<[Article], APIError> = .success(mockArticles)

    // mock
    let mockArticles: [Article] = [
        Article(title: "記事0"),
        Article(title: "記事1"),
        Article(title: "記事2"),
        Article(title: "記事3"),
        Article(title: "記事4"),
        Article(title: "記事5"),
        Article(title: "記事6"),
        Article(title: "記事7"),
        Article(title: "記事8"),
        Article(title: "記事9"),
        Article(title: "記事10"),
        Article(title: "記事11"),
        Article(title: "記事12"),
        Article(title: "記事13"),
        Article(title: "記事14"),
        Article(title: "記事15"),
        Article(title: "記事16"),
        Article(title: "記事17"),
        Article(title: "記事18"),
        Article(title: "記事19"),
    ]

    // stub
    func fetch(completion: @escaping ((Result<[Article], APIError>) -> Void)) {
        completion(fetchResult)
        switch fetchResult {
        case .success:
            returnArticles = mockArticles
        default:
            returnArticles = nil
        }
    }
}
