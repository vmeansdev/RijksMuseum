import AppHttpKit
import RijksData

protocol ServiceProviderProtocol {
    var artworksService: ArtworksServiceProtocol { get }
}

final class ServiceProvider: ServiceProviderProtocol {
    private let apiKey: String
    private let httpClient: Client

    init(apiKey: String, httpClient: Client) {
        self.apiKey = apiKey
        self.httpClient = httpClient
    }

    var artworksService: ArtworksServiceProtocol {
        ArtworksService(apiKey: apiKey, client: httpClient)
    }
}

