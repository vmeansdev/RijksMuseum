public struct Label: Codable, Sendable {
    public let title: String?
    public let makerLine: String?
    public let description: String?
    public let notes: String?
    public let date: String?

    public enum CodingKeys: String, CodingKey {
        case title = "title"
        case makerLine = "makerLine"
        case description = "description"
        case notes = "notes"
        case date = "date"
    }

    public init(title: String?, makerLine: String?, description: String?, notes: String?, date: String?) {
        self.title = title
        self.makerLine = makerLine
        self.description = description
        self.notes = notes
        self.date = date
    }
}
