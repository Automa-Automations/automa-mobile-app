//
//  Transactions.swift
//  Automa
//
//  Created by Simon Ferns on 2024/06/07.
//

import Foundation

func getUserTransactions(completion: @escaping ([Transaction]?, Error?) -> Void) async {
    let client = DataCoordinator().apolloClient
    client.fetch(query: AutomaGraphQLCodegen.FetchAllTransactionsQuery(userId: await userId_(), first: 1000), cachePolicy: .fetchIgnoringCacheCompletely) { result in
        switch result {
        case .success(let graphQLResult):
            if let transactionsData = graphQLResult.data?.transactionsCollection?.edges {
                            let transactions = transactionsData.compactMap { edge -> Transaction? in
                                let node = edge.node
                                guard let metadataString = node.metadata,
                                         let data = metadataString.data(using: .utf8),
                                         let metadata = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else { return nil }
                                
                                return Transaction(
                                    id: node.id,
                                    created_at: Date.fromTimestampz(node.created_at) ?? Date(),
                                    credits: Int(node.credits ?? "0")!,
                                    head: node.head ?? "",
                                    metadata: metadata,
                                    user_id: node.user_id ?? ""
                                )
                            }
                            completion(transactions, nil)
                        } else if let errors = graphQLResult.errors {
                            completion(nil, errors.first)
                        }
        case .failure(let error):
            completion(nil, error)
        }}
    
}
