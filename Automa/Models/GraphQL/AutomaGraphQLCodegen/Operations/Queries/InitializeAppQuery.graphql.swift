// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension AutomaGraphQLCodegen {
  class InitializeAppQuery: GraphQLQuery {
    static let operationName: String = "InitializeApp"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query InitializeApp($userId: UUID!, $transactionLimit: Int!) { transactionsCollection( filter: { user_id: { eq: $userId } } first: $transactionLimit ) { __typename edges { __typename node { __typename id head credits created_at } } } plansCollection { __typename edges { __typename node { __typename id credits cta_page created_at name hex_color_int popularity_score price price_rep } } } profilesCollection(filter: { id: { eq: $userId } }, first: 1) { __typename edges { __typename node { __typename id username credits avatar_url expiry_date stripe_customer_id plan_type } } } botsCollection(filter: { owner_id: { eq: $userId } }) { __typename edges { __typename node { __typename id friendly_name } } } }"#
      ))

    public var userId: UUID
    public var transactionLimit: Int

    public init(
      userId: UUID,
      transactionLimit: Int
    ) {
      self.userId = userId
      self.transactionLimit = transactionLimit
    }

    public var __variables: Variables? { [
      "userId": userId,
      "transactionLimit": transactionLimit
    ] }

    struct Data: AutomaGraphQLCodegen.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { AutomaGraphQLCodegen.Objects.Query }
      static var __selections: [ApolloAPI.Selection] { [
        .field("transactionsCollection", TransactionsCollection?.self, arguments: [
          "filter": ["user_id": ["eq": .variable("userId")]],
          "first": .variable("transactionLimit")
        ]),
        .field("plansCollection", PlansCollection?.self),
        .field("profilesCollection", ProfilesCollection?.self, arguments: [
          "filter": ["id": ["eq": .variable("userId")]],
          "first": 1
        ]),
        .field("botsCollection", BotsCollection?.self, arguments: ["filter": ["owner_id": ["eq": .variable("userId")]]]),
      ] }

      /// A pagable collection of type `transactions`
      var transactionsCollection: TransactionsCollection? { __data["transactionsCollection"] }
      /// A pagable collection of type `plans`
      var plansCollection: PlansCollection? { __data["plansCollection"] }
      /// A pagable collection of type `profiles`
      var profilesCollection: ProfilesCollection? { __data["profilesCollection"] }
      /// A pagable collection of type `bots`
      var botsCollection: BotsCollection? { __data["botsCollection"] }

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
              .field("head", String?.self),
              .field("credits", AutomaGraphQLCodegen.BigInt?.self),
              .field("created_at", AutomaGraphQLCodegen.Datetime.self),
            ] }

            var id: AutomaGraphQLCodegen.UUID { __data["id"] }
            var head: String? { __data["head"] }
            var credits: AutomaGraphQLCodegen.BigInt? { __data["credits"] }
            var created_at: AutomaGraphQLCodegen.Datetime { __data["created_at"] }
          }
        }
      }

      /// PlansCollection
      ///
      /// Parent Type: `PlansConnection`
      struct PlansCollection: AutomaGraphQLCodegen.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: ApolloAPI.ParentType { AutomaGraphQLCodegen.Objects.PlansConnection }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("edges", [Edge].self),
        ] }

        var edges: [Edge] { __data["edges"] }

        /// PlansCollection.Edge
        ///
        /// Parent Type: `PlansEdge`
        struct Edge: AutomaGraphQLCodegen.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: ApolloAPI.ParentType { AutomaGraphQLCodegen.Objects.PlansEdge }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("node", Node.self),
          ] }

          var node: Node { __data["node"] }

          /// PlansCollection.Edge.Node
          ///
          /// Parent Type: `Plans`
          struct Node: AutomaGraphQLCodegen.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: ApolloAPI.ParentType { AutomaGraphQLCodegen.Objects.Plans }
            static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("id", String.self),
              .field("credits", AutomaGraphQLCodegen.BigInt?.self),
              .field("cta_page", [String?]?.self),
              .field("created_at", AutomaGraphQLCodegen.Datetime.self),
              .field("name", String.self),
              .field("hex_color_int", AutomaGraphQLCodegen.BigInt.self),
              .field("popularity_score", AutomaGraphQLCodegen.BigInt.self),
              .field("price", Double?.self),
              .field("price_rep", String.self),
            ] }

            var id: String { __data["id"] }
            var credits: AutomaGraphQLCodegen.BigInt? { __data["credits"] }
            var cta_page: [String?]? { __data["cta_page"] }
            var created_at: AutomaGraphQLCodegen.Datetime { __data["created_at"] }
            var name: String { __data["name"] }
            var hex_color_int: AutomaGraphQLCodegen.BigInt { __data["hex_color_int"] }
            var popularity_score: AutomaGraphQLCodegen.BigInt { __data["popularity_score"] }
            var price: Double? { __data["price"] }
            var price_rep: String { __data["price_rep"] }
          }
        }
      }

      /// ProfilesCollection
      ///
      /// Parent Type: `ProfilesConnection`
      struct ProfilesCollection: AutomaGraphQLCodegen.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: ApolloAPI.ParentType { AutomaGraphQLCodegen.Objects.ProfilesConnection }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("edges", [Edge].self),
        ] }

        var edges: [Edge] { __data["edges"] }

        /// ProfilesCollection.Edge
        ///
        /// Parent Type: `ProfilesEdge`
        struct Edge: AutomaGraphQLCodegen.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: ApolloAPI.ParentType { AutomaGraphQLCodegen.Objects.ProfilesEdge }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("node", Node.self),
          ] }

          var node: Node { __data["node"] }

          /// ProfilesCollection.Edge.Node
          ///
          /// Parent Type: `Profiles`
          struct Node: AutomaGraphQLCodegen.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: ApolloAPI.ParentType { AutomaGraphQLCodegen.Objects.Profiles }
            static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("id", AutomaGraphQLCodegen.UUID.self),
              .field("username", String?.self),
              .field("credits", AutomaGraphQLCodegen.BigInt?.self),
              .field("avatar_url", String?.self),
              .field("expiry_date", AutomaGraphQLCodegen.Datetime?.self),
              .field("stripe_customer_id", String?.self),
              .field("plan_type", String?.self),
            ] }

            var id: AutomaGraphQLCodegen.UUID { __data["id"] }
            var username: String? { __data["username"] }
            var credits: AutomaGraphQLCodegen.BigInt? { __data["credits"] }
            var avatar_url: String? { __data["avatar_url"] }
            var expiry_date: AutomaGraphQLCodegen.Datetime? { __data["expiry_date"] }
            var stripe_customer_id: String? { __data["stripe_customer_id"] }
            var plan_type: String? { __data["plan_type"] }
          }
        }
      }

      /// BotsCollection
      ///
      /// Parent Type: `BotsConnection`
      struct BotsCollection: AutomaGraphQLCodegen.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: ApolloAPI.ParentType { AutomaGraphQLCodegen.Objects.BotsConnection }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("edges", [Edge].self),
        ] }

        var edges: [Edge] { __data["edges"] }

        /// BotsCollection.Edge
        ///
        /// Parent Type: `BotsEdge`
        struct Edge: AutomaGraphQLCodegen.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: ApolloAPI.ParentType { AutomaGraphQLCodegen.Objects.BotsEdge }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("node", Node.self),
          ] }

          var node: Node { __data["node"] }

          /// BotsCollection.Edge.Node
          ///
          /// Parent Type: `Bots`
          struct Node: AutomaGraphQLCodegen.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: ApolloAPI.ParentType { AutomaGraphQLCodegen.Objects.Bots }
            static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("id", AutomaGraphQLCodegen.BigInt.self),
              .field("friendly_name", String?.self),
            ] }

            var id: AutomaGraphQLCodegen.BigInt { __data["id"] }
            var friendly_name: String? { __data["friendly_name"] }
          }
        }
      }
    }
  }

}