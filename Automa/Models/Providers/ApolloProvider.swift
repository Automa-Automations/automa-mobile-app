//
//  ApolloProvider.swift
//  Automa
//
//  Created by Simon Ferns on 2024/06/07.
//

import SwiftUI
import Apollo

class DataCoordinator: NSObject {
    // MARK: Variables
    static let shared: DataCoordinator = DataCoordinator()
    private(set) lazy var apolloClient: ApolloClient = {
        let cache = InMemoryNormalizedCache()
        let store = ApolloStore(cache: cache)
        let authPayloads = ["apiKey": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Ind2emdlanBpc3V1a2dub2hzaW11Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTMzMjMwOTQsImV4cCI6MjAyODg5OTA5NH0.9PrMYgTH6oDILXKeaV7eCGJbFDdNYosAp2j0mxvmaLI"]
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = authPayloads
        let client = URLSessionClient(sessionConfiguration: configuration, callbackQueue: nil)
        let provider = NetworkInterceptorProvider(store: store, client: client)
        let url = URL(string: "https://wvzgejpisuukgnohsimu.supabase.co/graphql/v1")!
        let requestChainTransport = RequestChainNetworkTransport(interceptorProvider: provider, endpointURL: url)
        return ApolloClient(networkTransport: requestChainTransport, store: store)
    }()
}

struct NetworkInterceptorProvider: InterceptorProvider {
    // These properties will remain the same throughout the life of the `InterceptorProvider`, even though they
    // will be handed to different interceptors.
    private let store: ApolloStore
    private let client: URLSessionClient
    
    init(store: ApolloStore,
         client: URLSessionClient) {
        self.store = store
        self.client = client
    }
    
    func interceptors<Operation>(for operation: Operation) -> [ApolloInterceptor] {
        return [
            MaxRetryInterceptor(),
            CacheReadInterceptor(store: self.store),
            NetworkFetchInterceptor(client: self.client),
            ResponseCodeInterceptor(),
            JSONResponseParsingInterceptor(),
            AutomaticPersistedQueryInterceptor(),
            CacheWriteInterceptor(store: self.store)
        ]
    }
}
