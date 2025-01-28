import PlistReader

enum Environment {
    static var apiKey: String {
        try! PlistReader().value(for: "API_KEY")
    }

    static var baseURLString: String {
        ["https://", try! PlistReader().value(for: "API_BASE_URL")].joined()
    }
}

