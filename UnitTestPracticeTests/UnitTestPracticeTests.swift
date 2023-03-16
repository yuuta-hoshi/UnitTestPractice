//
//  UnitTestPracticeTests.swift
//  UnitTestPracticeTests
//
//  Created by 星優大 on 2023/03/17.
//

import XCTest
@testable import UnitTestPractice

final class UnitTestPracticeTests: XCTestCase {
    
    private var mockArticlesAPIClient: MockArticlesAPIClient!
    private var articleViewModel: ArticleViewModel!
    
    func test_記事が正常に取得できている() {
        XCTAssertNotNil(articleViewModel.articles)
        XCTAssertEqual(articleViewModel.articles[0].title, "記事0")
        XCTAssertEqual(articleViewModel.articles[17].title, "記事17")
    }

    func test_通信エラーだとnetworkErrorを返す() {
        mockArticlesAPIClient.fetchResult = .failure(APIError.networkError)
        articleViewModel = ArticleViewModel(fetchArticlesAPIClient: mockArticlesAPIClient)
        XCTAssertEqual(articleViewModel.apiError, APIError.networkError)
    }

    func test_値が空だとnoneValueを返す() {
        mockArticlesAPIClient.fetchResult = .failure(APIError.noneValue)
        articleViewModel = ArticleViewModel(fetchArticlesAPIClient: mockArticlesAPIClient)
        XCTAssertEqual(articleViewModel.apiError, APIError.noneValue)
    }

    func test_無効なURLだとinvalidURLを返す() {
        mockArticlesAPIClient.fetchResult = .failure(APIError.invalidURL)
        articleViewModel = ArticleViewModel(fetchArticlesAPIClient: mockArticlesAPIClient)
        XCTAssertEqual(articleViewModel.apiError, APIError.invalidURL)
    }

    func test_不明なエラーだとunknownを返す() {
        mockArticlesAPIClient.fetchResult = .failure(APIError.unknown)
        articleViewModel = ArticleViewModel(fetchArticlesAPIClient: mockArticlesAPIClient)
        XCTAssertEqual(articleViewModel.apiError, APIError.unknown)
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
