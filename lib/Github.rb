require "graphql/client"
require "graphql/client/http"

module Github
  GITHUB_ACCESS_TOKEN = ENV['GITHUB_ACCESS_TOKEN']
  URL = 'https://api.github.com/graphql'
  HttpAdapter = GraphQL::Client::HTTP.new(URL) do
    def headers(context)
      {
        "Authorization" => "Bearer #{GITHUB_ACCESS_TOKEN}",
        "User-Agent" => 'Ruby'
      }
    end
  end
  Schema = GraphQL::Client.load_schema(HttpAdapter)
  Client = GraphQL::Client.new(schema: Schema, execute: HttpAdapter)

  class Repository
    RepositoryQuery = Github::Client.parse <<-'GRAPHQL'
      query($name: String!, $owner: String!) {
        repository(name: $name, owner: $owner) {
          stargazerCount
          forkCount
          updatedAt
        }
      }
    GRAPHQL

    def self.find(name, owner)
      response = Github::Client.query(RepositoryQuery, variables: { name: name, owner: owner })
      if response.errors.any?
        raise QueryExecutionError.new(response.errors[:data].join(", "))
      else
        response.data.repository
      end
    end

  end
end