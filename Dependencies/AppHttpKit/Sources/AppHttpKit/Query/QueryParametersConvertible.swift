import AnyCodable

public protocol QueryParametersConvertible { }

extension QueryParametersConvertible {
    public var params: [String: AnyEncodable] {
        extractParameters(self)
    }

    private func extractParameters<T>(_ instance: T) -> [String: AnyEncodable] {
        let mirror = Mirror(reflecting: instance)
        var result: [String: AnyEncodable] = [:]

        for child in mirror.children {
            if let queryParameter = child.value as? QueryParameter<Any> {
                result[queryParameter.key] = AnyEncodable(queryParameter.wrappedValue)
            }
        }
        return result
    }
}
