import AnyCodable
import Testing
@testable import AppHttpKit

struct QueryParametersConvertibleTests {
    @Test
    func manyParamsTest() {
        let environment = Environment()
        #expect(environment.mockQuery.params == environment.mockParams)
    }
}

private struct Environment {
    let mockQuery = MockQuery(message: "qwer", age: 30, isActive: false)
    let mockParams = ["msg": AnyEncodable("qwer"), "age": AnyEncodable(30), "isActive": AnyEncodable(false)]
}
