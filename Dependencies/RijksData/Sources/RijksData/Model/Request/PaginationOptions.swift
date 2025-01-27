import AnyCodable
import AppHttpKit

public struct PaginationOptions: QueryParametersConvertible, Sendable {
    @QueryParameter(1, "p") var page: Int
    @QueryParameter(10, "ps") var limit: Int

    public init(page: Int, limit: Int) {
        self.page = page
        self.limit = limit
    }

    public func toParams(with apiKey: String) -> [String: AnyEncodable] {
        var params = self.params
        params["key"] = AnyEncodable(apiKey)
        return params
    }
}

