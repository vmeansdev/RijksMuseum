public struct Dating: Codable, Sendable {
    public let presentingDate: String
    public let sortingDate: Int
    public let period: Int
    public let yearEarly: Int
    public let yearLate: Int

    public enum CodingKeys: String, CodingKey {
        case presentingDate = "presentingDate"
        case sortingDate = "sortingDate"
        case period = "period"
        case yearEarly = "yearEarly"
        case yearLate = "yearLate"
    }

    public init(presentingDate: String, sortingDate: Int, period: Int, yearEarly: Int, yearLate: Int) {
        self.presentingDate = presentingDate
        self.sortingDate = sortingDate
        self.period = period
        self.yearEarly = yearEarly
        self.yearLate = yearLate
    }
}
