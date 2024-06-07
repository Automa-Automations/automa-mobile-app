// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension AutomaGraphQLCodegen {
  class FetchTransactionsQuery: GraphQLQuery {
    static let operationName: String = "fetchTransactions"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query fetchTransactions { transactionsCollection { __typename edges { __typename node { __typename id created_at credits head metadata user_id } } } }"#
      ))

    public init() {}

    struct Data: AutomaGraphQLCodegen.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { AutomaGraphQLCodegen.Objects.Query }
      static var __selections: [ApolloAPI.Selection] { [
        .field("transactionsCollection", TransactionsCollection?.self),
      ] }

      /// A pagable collection of type `transactions`
      var transactionsCollection: TransactionsCollection? { __data["transactionsCollection"] }

      /// TransactionsCollection
      ///
      /// Parent Type: `TransactionsConnection`
      struct TransactionsCollection: AutomaGraphQLCodegen.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: ApolloAPI.ParentType { AutomaGraphQLCodegen.Objects.TransactionsConnection }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("edges", [Edge].self),
        ] }

        var edges: [Edge] { __data["edges"] }

        /// TransactionsCollection.Edge
        ///
        /// Parent Type: `TransactionsEdge`
        struct Edge: AutomaGraphQLCodegen.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: ApolloAPI.ParentType { AutomaGraphQLCodegen.Objects.TransactionsEdge }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("node", Node.self),
          ] }

          var node: Node { __data["node"] }

          /// TransactionsCollection.Edge.Node
          ///
          /// Parent Type: `Transactions`
          struct Node: AutomaGraphQLCodegen.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: ApolloAPI.ParentType { AutomaGraphQLCodegen.Objects.Transactions }
            static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("id", AutomaGraphQLCodegen.UUID.self),
              .field("created_at", AutomaGraphQLCodegen.Datetime.self),
              .field("credits", AutomaGraphQLCodegen.BigInt?.self),
              .field("head", String?.self),
              .field("metadata", AutomaGraphQLCodegen.JSON?.self),
              .field("user_id", AutomaGraphQLCodegen.UUID?.self),
            ] }

            var id: AutomaGraphQLCodegen.UUID { __data["id"] }
            var created_at: AutomaGraphQLCodegen.Datetime { __data["created_at"] }
            var credits: AutomaGraphQLCodegen.BigInt? { __data["credits"] }
            var head: String? { __data["head"] }
            var metadata: AutomaGraphQLCodegen.JSON? { __data["metadata"] }
            var user_id: AutomaGraphQLCodegen.UUID? { __data["user_id"] }
          }
        }
      }
    }
  }

}