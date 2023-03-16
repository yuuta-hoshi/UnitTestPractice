//
//  APIError.swift
//  UnitTestPractice
//
//  Created by 星優大 on 2023/03/16.
//

import Foundation

enum APIError: Error {
    case noneValue
    case invalidURL
    case networkError
    case unknown
    var title: String{
        switch self{
        case .noneValue:
            return "値が空で取得されたエラー"
        case .invalidURL:
            return "無効なURLのエラー"
        case .networkError:
            return "ネットワークエラー"
        default:
            return "不明なエラー"
        }
    }
}
