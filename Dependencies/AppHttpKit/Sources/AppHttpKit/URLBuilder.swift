import Foundation

public enum URLBuilderError: Error {
    case buildURL(urlString: String)
}

public protocol URLBuilder {
    func buildURL(baseURL: String, request: Request) throws -> URL
}

public class HttpURLBuilder: URLBuilder {
    public init() { }

    public func buildURL(baseURL: String, request: Request) throws -> URL {
        try buildURL(baseURL: baseURL, path: request.url, query: buildQuery(request))
    }

    private func buildURL(baseURL: String, path: String, query: [URLQueryItem]?) throws -> URL {
        guard let baseURL = URL(string: baseURL) else {
            throw URLBuilderError.buildURL(urlString: baseURL)
        }
        let absoluteURL = baseURL.appendingPathComponent(path)
        guard var components = URLComponents(url: absoluteURL, resolvingAgainstBaseURL: true) else {
            throw URLBuilderError.buildURL(urlString: absoluteURL.absoluteString)
        }
        if let query = query, !query.isEmpty {
            components.queryItems = (components.queryItems ?? []) + query
        }
        guard let result = components.url else {
            throw URLBuilderError.buildURL(urlString: absoluteURL.absoluteString)
        }
        return result
    }

    private func buildQuery(_ request: Request) -> [URLQueryItem] {
        guard let params = request.queryParams else { return [] }
        return params.reduce(into: []) { query, tuple in
            let (key, value) = tuple
            query.append(URLQueryItem(name: key, value: String(describing: value)))
        }
    }
}
