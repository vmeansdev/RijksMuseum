import XCTest
@testable import AppHttpKit
@testable import RijksData

final class ArtworksServiceTests: XCTestCase {
    func test_fetchCollection_returnsExpectedCollection() async throws {
        let environment = Environment()
        let sut = environment.makeSUT()
        environment.mockClient.responseReturnValue = environment.mockFetchCollectionResponse

        let response = try await sut.fetchCollection(for: .nl, options: .init(page: 1, limit: 1))
        XCTAssert(response.count == 1)
    }

    func test_fetchCollectionDetails_returnsDetailsOfArtwork() async throws {
        let environment = Environment()
        let sut = environment.makeSUT()
        environment.mockClient.responseReturnValue = environment.mockFetchCollectionDetailsResponse
        
        let response = try await sut.fetchCollectionDetails(for: .nl, objectNumber: "SK-C-5")
        XCTAssert(response.objectNumber == "SK-C-5")
    }
}

private final class Environment {
    let mockClient = MockClient()

    @SampleFile(fileName: "fetchCollection.json")
    var fetchCollectionJSONURL: URL
    lazy var mockFetchCollectionResponse = Response(
        request: Request(url: "/fetchCollection"),
        response: URLResponse(),
        body: try! Data(contentsOf: fetchCollectionJSONURL)
    )

    @SampleFile(fileName: "fetchCollectionDetails.json")
    var fetchCollectionDetailsJSONURL: URL
    lazy var mockFetchCollectionDetailsResponse = Response(
        request: Request(url: "/fetchCollectionDetails"),
        response: URLResponse(),
        body: try! Data(contentsOf: fetchCollectionDetailsJSONURL)
    )

    func makeSUT() -> ArtworksServiceProtocol {
        ArtworksService(apiKey: "MOCK_API_KEY", client: mockClient)
    }
}
