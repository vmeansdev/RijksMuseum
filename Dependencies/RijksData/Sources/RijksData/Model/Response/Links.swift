public struct Links: Codable, Sendable {
    public let linksSelf: String
    public let web: String

    public enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case web = "web"
    }

    public init(linksSelf: String, web: String) {
        self.linksSelf = linksSelf
        self.web = web
    }
}
