//
//  ArticleListAPIClientProtocol.swift
//  UnitTestPractice
//
//  Created by 星優大 on 2023/03/16.
//

import Foundation

protocol ArticleListAPIClientProtocol {
    func fetch(completion: @escaping ((Result<[Article], APIError>) -> Void))
}
