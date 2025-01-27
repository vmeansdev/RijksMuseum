@testable import AppHttpKit

final class MockClient: Client {
    var requestCallsCount = 0
    var requestCalledOnce: Bool { requestCallsCount == 1 }
    var requestCalled: Bool { requestCallsCount > 0 }
    var responseReturnValue: Response!
    var responseReturnClosure: ((Request) -> Response)?
    func request(_ httpRequest: Request) async throws -> Response {
        requestCallsCount += 1
        return responseReturnClosure.map({ $0(httpRequest) }) ?? responseReturnValue
    }
}

