import Foundation
@testable import RijksData

@propertyWrapper
struct SampleFile {
    let fileName: String

    var wrappedValue: URL {
        let file = fileName.split(separator: ".").first!
        let fileExtension = fileName.split(separator: ".").last!
        let url = Bundle.module.url(forResource: String(file), withExtension: String(fileExtension))!
        return url
    }

    var projectedValue: String {
        fileName
    }
}

