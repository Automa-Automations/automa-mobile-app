// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

protocol AutomaGraphQLCodegen_SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == AutomaGraphQLCodegen.SchemaMetadata {}

protocol AutomaGraphQLCodegen_InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == AutomaGraphQLCodegen.SchemaMetadata {}

protocol AutomaGraphQLCodegen_MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == AutomaGraphQLCodegen.SchemaMetadata {}

protocol AutomaGraphQLCodegen_MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == AutomaGraphQLCodegen.SchemaMetadata {}

extension AutomaGraphQLCodegen {
  typealias SelectionSet = AutomaGraphQLCodegen_SelectionSet

  typealias InlineFragment = AutomaGraphQLCodegen_InlineFragment

  typealias MutableSelectionSet = AutomaGraphQLCodegen_MutableSelectionSet

  typealias MutableInlineFragment = AutomaGraphQLCodegen_MutableInlineFragment

  enum SchemaMetadata: ApolloAPI.SchemaMetadata {
    static let configuration: ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

    static func objectType(forTypename typename: String) -> ApolloAPI.Object? {
      switch typename {
      case "Query": return AutomaGraphQLCodegen.Objects.Query
      case "transactionsConnection": return AutomaGraphQLCodegen.Objects.TransactionsConnection
      case "transactionsEdge": return AutomaGraphQLCodegen.Objects.TransactionsEdge
      case "transactions": return AutomaGraphQLCodegen.Objects.Transactions
      case "bot_sessions": return AutomaGraphQLCodegen.Objects.Bot_sessions
      case "bots": return AutomaGraphQLCodegen.Objects.Bots
      case "plans": return AutomaGraphQLCodegen.Objects.Plans
      case "profiles": return AutomaGraphQLCodegen.Objects.Profiles
      case "proxies": return AutomaGraphQLCodegen.Objects.Proxies
      case "PageInfo": return AutomaGraphQLCodegen.Objects.PageInfo
      default: return nil
      }
    }
  }

  enum Objects {}
  enum Interfaces {}
  enum Unions {}

}