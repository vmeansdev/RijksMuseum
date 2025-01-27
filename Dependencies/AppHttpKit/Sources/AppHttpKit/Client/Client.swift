import AnyCodable
import Foundation

public protocol Client {
    func request(_ httpRequest: Request) async throws -> Response
}

public extension Client {
    func get(_ endpoint: String, params: [String: AnyEncodable]? = nil, headers: [String: String]? = nil) async throws -> Data {
        try await request(.init(method: .get, url: endpoint, queryParams: params, headers: headers)).body
    }

    func post(_ endpoint: String, params: [String: AnyEncodable]? = nil, headers: [String: String]? = nil) async throws -> Data {
        try await request(.init(method: .post, url: endpoint, queryParams: params, headers: headers)).body
    }

    func put(_ endpoint: String, params: [String: AnyEncodable]? = nil, headers: [String: String]? = nil) async throws -> Data {
        try await request(.init(method: .put, url: endpoint, queryParams: params, headers: headers)).body
    }

    func patch(_ endpoint: String, params: [String: AnyEncodable]? = nil, headers: [String: String]? = nil) async throws -> Data {
        try await request(.init(method: .patch, url: endpoint, queryParams: params, headers: headers)).body
    }

    func delete(_ endpoint: String, params: [String: AnyEncodable]? = nil, headers: [String: String]? = nil) async throws -> Data {
        try await request(.init(method: .delete, url: endpoint, queryParams: params, headers: headers)).body
    }
}
