import Foundation

func getUserTransactions(completion: @escaping ([Transaction]?, Int?, Error?) -> Void) async {
    let client = DataCoordinator().apolloClient
    client.fetch(query: AutomaGraphQLCodegen.FetchAllTransactionsQuery(userId: await userId_(), first: 1000), cachePolicy: .fetchIgnoringCacheCompletely) { result in
        switch result {
        case .success(let graphQLResult):
            var transactions: [Transaction]?
            var credits: Int?
            
            if let transactionsData = graphQLResult.data?.transactionsCollection?.edges {
                transactions = transactionsData.compactMap { edge -> Transaction? in
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
            }
            
            if let profilesData = graphQLResult.data?.profilesCollection?.edges, let node = profilesData.first?.node {
                credits = Int(node.credits ?? "0") ?? 0
            }
            
            let sortedTransactions = transactions?.sorted(by: { $0.created_at > $1.created_at }) // Sort transactions by created_at date in descending order
            
            completion(sortedTransactions, credits, nil)
            
            if let errors = graphQLResult.errors {
                completion(nil, nil, errors.first)
            }
        case .failure(let error):
            completion(nil, nil, error)
        }
    }
}
