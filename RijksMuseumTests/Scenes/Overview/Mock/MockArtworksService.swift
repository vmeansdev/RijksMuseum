@testable import RijksMuseum
import RijksData

final class MockArtworksService: ArtworksServiceProtocol {
    var fetchCollectionCalledTimes = 0
    var fetchCollectionCalled: Bool {
        fetchCollectionCalledTimes > 0
    }
    var fetchCollectionCalledOnce: Bool {
        fetchCollectionCalledTimes == 1
    }
    var fetchCollectionCalledInputValue: (Culture, PaginationOptions)?
    var fetchCollectionCalledReturnValue: [Artwork]!
    var fetchCollectionCalledReturnClosure: ((Culture, PaginationOptions) -> [Artwork])?
    func fetchCollection(for culture: Culture, options: PaginationOptions) async throws -> [Artwork] {
        fetchCollectionCalledTimes += 1
        fetchCollectionCalledInputValue = (culture, options)
        return fetchCollectionCalledReturnClosure.map { $0(culture, options) } ?? fetchCollectionCalledReturnValue
    }

    var fetchCollectionDetailsCalledTimes = 0
    var fetchCollectionDetailsCalled: Bool {
        fetchCollectionDetailsCalledTimes > 0
    }
    var fetchCollectionDetailsCalledOnce: Bool {
        fetchCollectionDetailsCalledTimes == 1
    }
    var fetchCollectionDetailsCalledInputValue: (Culture, String)?
    var fetchCollectionDetailsCalledReturnValue: Artwork!
    var fetchCollectionDetailsCalledReturnClosure: ((Culture, String) -> Artwork)?
    func fetchCollectionDetails(for culture: Culture, objectNumber: String) async throws -> Artwork {
        fetchCollectionDetailsCalledTimes += 1
        fetchCollectionDetailsCalledInputValue = (culture, objectNumber)
        return fetchCollectionDetailsCalledReturnClosure.map { $0(culture, objectNumber) } ?? fetchCollectionDetailsCalledReturnValue
    }
}
