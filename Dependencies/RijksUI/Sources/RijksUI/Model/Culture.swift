public enum Culture: String, Equatable {
    case nl
    case en

    public var uppercased: String {
        rawValue.uppercased()
    }

    public var emoji: String {
        switch self {
        case .nl: return "🇳🇱"
        case .en: return "🇺🇸"
        }
    }
}

