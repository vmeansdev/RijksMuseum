public struct Image: Codable, Sendable {
    public let guid: String?
    public let offsetPercentageX: Int?
    public let offsetPercentageY: Int?
    public let width: Int
    public let height: Int
    public let url: String

    public enum CodingKeys: String, CodingKey {
        case guid = "guid"
        case offsetPercentageX = "offsetPercentageX"
        case offsetPercentageY = "offsetPercentageY"
        case width = "width"
        case height = "height"
        case url = "url"
    }

    public init(guid: String?, offsetPercentageX: Int?, offsetPercentageY: Int?, width: Int, height: Int, url: String) {
        self.guid = guid
        self.offsetPercentageX = offsetPercentageX
        self.offsetPercentageY = offsetPercentageY
        self.width = width
        self.height = height
        self.url = url
    }
}

