import AppHttpKit
import Foundation

public protocol ArtworksServiceProtocol {
    func fetchCollection(for culture: Culture, options: PaginationOptions) async throws -> [Artwork]
    func fetchCollectionDetails(for culture: Culture, objectNumber: String) async throws -> Artwork
}

public final class ArtworksService: ArtworksServiceProtocol {
    private let apiKey: String
    private let client: Client
    private let decoder: JSONDecoder

    public init(apiKey: String, client: Client, decoder: JSONDecoder = JSONDecoder()) {
        self.apiKey = apiKey
        self.client = client
        self.decoder = decoder
    }

    public func fetchCollection(for culture: Culture, options: PaginationOptions) async throws -> [Artwork] {
        let response = try await client.get("\(culture.rawValue)/collection", queryParams: options.buildParams(with: .init(key: apiKey)))
        return try decoder.decode(CollectionResponse.self, from: response).artObjects
    }

    public func fetchCollectionDetails(for culture: Culture, objectNumber: String) async throws -> Artwork {
        let response = try await client.get("\(culture.rawValue)/collection/\(objectNumber)", queryParams: KeyParameters(key: apiKey))
        return try decoder.decode(CollectionDetailsResponse.self, from: response).artObject
    }
}
