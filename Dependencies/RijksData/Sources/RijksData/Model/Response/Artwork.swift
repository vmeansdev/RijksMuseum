public struct Artwork: Codable, Sendable {
    public let links: Links
    public let id: String
    public let objectNumber: String
    public let title: String
    public let hasImage: Bool
    public let principalOrFirstMaker: String
    public let longTitle: String
    public let showImage: Bool
    public let permitDownload: Bool
    public let webImage: Image
    public let headerImage: Image
    public let productionPlaces: [String]

    public enum CodingKeys: String, CodingKey {
        case links = "links"
        case id = "id"
        case objectNumber = "objectNumber"
        case title = "title"
        case hasImage = "hasImage"
        case principalOrFirstMaker = "principalOrFirstMaker"
        case longTitle = "longTitle"
        case showImage = "showImage"
        case permitDownload = "permitDownload"
        case webImage = "webImage"
        case headerImage = "headerImage"
        case productionPlaces = "productionPlaces"
    }

    public init(
        links: Links,
        id: String,
        objectNumber: String,
        title: String,
        hasImage: Bool,
        principalOrFirstMaker: String,
        longTitle: String,
        showImage: Bool,
        permitDownload: Bool,
        webImage: Image,
        headerImage: Image,
        productionPlaces: [String]
    ) {
        self.links = links
        self.id = id
        self.objectNumber = objectNumber
        self.title = title
        self.hasImage = hasImage
        self.principalOrFirstMaker = principalOrFirstMaker
        self.longTitle = longTitle
        self.showImage = showImage
        self.permitDownload = permitDownload
        self.webImage = webImage
        self.headerImage = headerImage
        self.productionPlaces = productionPlaces
    }
}
