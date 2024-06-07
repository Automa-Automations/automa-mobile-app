// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension AutomaGraphQLCodegen {
  class FetchAllTransactionsPaginatedQuery: GraphQLQuery {
    static let operationName: String = "fetchAllTransactionsPaginated"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query fetchAllTransactionsPaginated($userId: UUID!, $first: Int, $after: Cursor) { transactionsCollection( filter: { user_id: { eq: $userId } } first: $first after: $after ) { __typename edges { __typename cursor node { __typename id created_at credits head metadata user_id } } pageInfo { __typename endCursor hasNextPage } } }"#
      ))

    public var userId: UUID
    public var first: GraphQLNullable<Int>
    public var after: GraphQLNullable<Cursor>

    public init(
      userId: UUID,
      first: GraphQLNullable<Int>,
      after: GraphQLNullable<Cursor>
    ) {
      self.userId = userId
      self.first = first
      self.after = after
    }

    public var __variables: Variables? { [
      "userId": userId,
      "first": first,
      "after": after
    ] }

    struct Data: AutomaGraphQLCodegen.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { AutomaGraphQLCodegen.Objects.Query }
      static var __selections: [ApolloAPI.Selection] { [
        .field("transactionsCollection", TransactionsCollection?.self, arguments: [
          "filter": ["user_id": ["eq": .variable("userId")]],
          "first": .variable("first"),
          "after": .variable("after")
        ]),
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
          .field("pageInfo", PageInfo.self),
        ] }

        var edges: [Edge] { __data["edges"] }
        var pageInfo: PageInfo { __data["pageInfo"] }

        /// TransactionsCollection.Edge
        ///
        /// Parent Type: `TransactionsEdge`
        struct Edge: AutomaGraphQLCodegen.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: ApolloAPI.ParentType { AutomaGraphQLCodegen.Objects.TransactionsEdge }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("cursor", String.self),
            .field("node", Node.self),
          ] }

          var cursor: String { __data["cursor"] }
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

        /// TransactionsCollection.PageInfo
        ///
        /// Parent Type: `PageInfo`
        struct PageInfo: AutomaGraphQLCodegen.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: ApolloAPI.ParentType { AutomaGraphQLCodegen.Objects.PageInfo }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("endCursor", String?.self),
            .field("hasNextPage", Bool.self),
          ] }

          var endCursor: String? { __data["endCursor"] }
          var hasNextPage: Bool { __data["hasNextPage"] }
        }
      }
    }
  }

}