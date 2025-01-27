import Foundation
import Testing
@testable import AppHttpKit

struct HttpClientTests {
    @Test
    func test_getRequest_whenSuccess_returnsData() async throws {
        let environment = Environment()
        let sut = environment.makeSUT()

        let response = try await sut.get(environment.testEndpoint)
        #expect(response == environment.expectedData)
    }

    @Test
    func test_postRequest_whenSuccess_returnsData() async throws {
        let environment = Environment()
        let sut = environment.makeSUT()

        let response = try await sut.post(environment.testEndpoint)
        #expect(response == environment.expectedData)
    }
}

private struct Environment {
    private let baseURL = "https://api.example.com"
    let testEndpoint = "/example.json"
    let expectedData = "{\"key\": \"value\"}\n".data(using: .utf8)!

    init() {
        URLProtocol.registerClass(MockURLProtocol.self)
    }

    func makeSUT() -> Client {
        HttpClient(baseURL: baseURL)
    }
}
