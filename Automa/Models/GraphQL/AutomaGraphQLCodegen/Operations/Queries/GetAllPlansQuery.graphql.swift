// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension AutomaGraphQLCodegen {
  class GetAllPlansQuery: GraphQLQuery {
    static let operationName: String = "GetAllPlans"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query GetAllPlans { plansCollection { __typename edges { __typename node { __typename id } } } }"#
      ))

    public init() {}

    struct Data: AutomaGraphQLCodegen.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { AutomaGraphQLCodegen.Objects.Query }
      static var __selections: [ApolloAPI.Selection] { [
        .field("plansCollection", PlansCollection?.self),
      ] }

      /// A pagable collection of type `plans`
      var plansCollection: PlansCollection? { __data["plansCollection"] }

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
            ] }

            var id: String { __data["id"] }
          }
        }
      }
    }
  }

}