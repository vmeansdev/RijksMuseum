public struct Links: Codable, Sendable, Equatable {
    public let linksSelf: String?
    public let web: String?
    public let search: String?

    public enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case web = "web"
        case search = "search"
    }

    public init(linksSelf: String?, web: String?, search: String?) {
        self.linksSelf = linksSelf
        self.web = web
        self.search = search
    }
}
