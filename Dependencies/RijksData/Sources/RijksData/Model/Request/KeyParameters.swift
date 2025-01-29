import AppHttpKit

struct KeyParameters: QueryParametersConvertible {
    @QueryParameter("", "key") var key: String

    init(key: String) {
        self.key = key
    }
}
