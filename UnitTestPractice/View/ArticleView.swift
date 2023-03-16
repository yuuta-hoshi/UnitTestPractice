//
//  ArticleView.swift
//  UnitTestPractice
//
//  Created by 星優大 on 2023/03/16.
//

import SwiftUI

struct Article: Codable {
    let title: String
}

struct ArticleView: View {
    @ObservedObject var viewModel = ArticleViewModel()

    var body: some View {
        VStack {
            List {
                ForEach(0..<viewModel.articles.count, id: \.self) { index in
                    Text(viewModel.articles[index].title)
                }
            }
        }
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView()
    }
}
