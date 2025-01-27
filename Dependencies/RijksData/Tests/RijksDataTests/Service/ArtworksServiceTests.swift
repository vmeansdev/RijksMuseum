import XCTest
@testable import AppHttpKit
@testable import RijksData

final class ArtworksServiceTests: XCTestCase {
    func test_fetchArtworks_returnsExpectedArtworks() async throws {
        let environment = Environment()
        let sut = environment.makeSUT()
        environment.mockClient.responseReturnValue = environment.mockResponse

        let response = try await sut.fetchCollection(for: .nl, options: .init(page: 1, limit: 1))
        XCTAssert(response.count == 1)
    }
}

private struct Environment {
    let mockClient = MockClient()
    let mockResponse = Response(request: Request(url: "/example"), response: URLResponse(), body: mockRawJSONRespone)

    func makeSUT() -> ArtworksService {
        ArtworksService(apiKey: "MOCK_API_KEY", client: mockClient)
    }

    let mockRawJSONRespone = """
    {
      "elapsedMilliseconds": 0,
      "count": 3491,
      "artObjects": [
        {
          "links": {
            "self": "http://www.rijksmuseum.nl/api/nl/collection/SK-C-5",
            "web": "http://www.rijksmuseum.nl/nl/collectie/SK-C-5"
          },
          "id": "nl-SK-C-5",
          "objectNumber": "SK-C-5",
          "title": "De Nachtwacht",
          "hasImage": true,
          "principalOrFirstMaker": "Rembrandt van Rijn",
          "longTitle": "De Nachtwacht, Rembrandt van Rijn, 1642",
          "showImage": true,
          "permitDownload": true,
          "webImage": {
              "guid": "bbd1fae8-4023-4859-8ed1-d38616aec96c",
              "offsetPercentageX": 0,
              "offsetPercentageY": 1,
              "width": 5656,
              "height": 4704,
              "url":"https://lh3.googleusercontent.com/SsEIJWka3_cYRXXSE8VD3XNOgtOxoZhqW1uB6UFj78eg8gq3G4jAqL4Z_5KwA12aD7Leqp27F653aBkYkRBkEQyeKxfaZPyDx0O8CzWg=s0"
          },
          "headerImage": {
            "guid": "29a2a516-f1d2-4713-9cbd-7a4458026057",
            "offsetPercentageX": 0,
            "offsetPercentageY": 0,
            "width": 1920,
            "height": 460,
            "url": "https://lh3.googleusercontent.com/nAHNYM604vhPa1hbE_hBJw55JI01-ls0zCwHwvDEES38PpGyGHMgG_vaigVWSuK8GFkaxfn2Dmevw_Nmujn5dKW3jItgS6QaSI8VIsiH=s0"
          },
          "productionPlaces": ["Amsterdam"]
        }
      ]
    }
    """.data(using: .utf8)!
}



