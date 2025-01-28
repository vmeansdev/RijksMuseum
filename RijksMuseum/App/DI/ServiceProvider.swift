import AppHttpKit
import RijksData

protocol ServiceProviderProtocol {
    var artworksService: ArtworksServiceProtocol { get }
}

final class ServiceProvider: ServiceProviderProtocol {
    let artworksService: ArtworksServiceProtocol

    init(apiKey: String, httpClient: Client) {
        self.artworksService = ArtworksService(apiKey: apiKey, client: httpClient)
    }
}

