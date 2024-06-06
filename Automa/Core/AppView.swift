//
//  AppView.swift
//  Automa
//
//  Created by Simon Ferns on 2024/05/03.
//

import Foundation
import SwiftUI
import Foundation
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

func executeApolloQuery() {
    let client = DataCoordinator.shared.apolloClient
    
    client.fetch(query: AutomaGraphQLCodegen.GetAllPlansQuery()) { result in
        let data = try! result.get().data
        let dataTest = data?.plansCollection?.edges
        let value = dataTest?.count ?? 0
        if dataTest != nil {
            let node = dataTest?[0].node
            print(node?.id ?? nil)
        }
        print(value)
    }
}

struct AppView: View {
    @State var isAuthenticated = false
    @State var shouldUserPayBool = false
    @State var hasAppLoaded = false

    var body: some View {
        Group {
            if !hasAppLoaded {
                ProgressView()
            } else {
                if isAuthenticated && shouldUserPayBool {
                    PlanPaymentScreen(isAuthenticated: $isAuthenticated, shouldShowPaymentScreen: $shouldUserPayBool)
                } else if isAuthenticated {
                    HomeScreen()
                } else {
                    AuthScreen()
                }
            }
        }
        .task {
            do {
                
                
                for await state in await supabase_().auth.authStateChanges {
                    if [.initialSession, .signedIn, .signedOut].contains(state.event) {
                        isAuthenticated = state.session != nil
                        if isAuthenticated {
                            shouldUserPayBool = await shouldUserPay()
                        }
                        hasAppLoaded = true
                    }
                }
            } catch {
                print("Error configuring Supabase: \(error)")
            }
        }
        .onAppear {
            executeApolloQuery()
        }
    }

    func shouldUserPay() async -> Bool {
        do {
            let currentUser = try await supabase_().auth.session.user
            let userId = currentUser.id

            let profile: Profile = try await supabase_().database
                .from("profiles")
                .select()
                .eq("id", value: userId)
                .single()
                .execute()
                .value
            
            // Print my bearer token
            let key = try await supabase_().auth.session.accessToken
            print(key)

            let currentTimeStamp = Date().timeIntervalSince1970
            if profile.expiry_date == nil {
                return false
            }

            if profile.expiry_date?.timeIntervalSince1970 ?? Double(0.0) < currentTimeStamp {
                return true
            }

        } catch {
            print("Something")
        }
        return false
    }
}
