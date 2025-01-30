public struct PrincipalMaker: Codable, Sendable, Equatable {
    public let name: String?
    public let unFixedName: String?
    public let placeOfBirth: String?
    public let dateOfBirth: String?
    public let dateOfBirthPrecision: String?
    public let dateOfDeath: String?
    public let dateOfDeathPrecision: String?
    public let placeOfDeath: String?
    public let occupation: [String]?
    public let roles: [String]?
    public let nationality: String?
    public let biography: String?
    public let productionPlaces: [String]?
    public let qualification: String?
    public let labelDesc: String?

    public enum CodingKeys: String, CodingKey {
        case name = "name"
        case unFixedName = "unFixedName"
        case placeOfBirth = "placeOfBirth"
        case dateOfBirth = "dateOfBirth"
        case dateOfBirthPrecision = "dateOfBirthPrecision"
        case dateOfDeath = "dateOfDeath"
        case dateOfDeathPrecision = "dateOfDeathPrecision"
        case placeOfDeath = "placeOfDeath"
        case occupation = "occupation"
        case roles = "roles"
        case nationality = "nationality"
        case biography = "biography"
        case productionPlaces = "productionPlaces"
        case qualification = "qualification"
        case labelDesc = "labelDesc"
    }

    public init(name: String?, unFixedName: String?, placeOfBirth: String?, dateOfBirth: String?, dateOfBirthPrecision: String?, dateOfDeath: String?, dateOfDeathPrecision: String?, placeOfDeath: String?, occupation: [String]?, roles: [String]?, nationality: String?, biography: String?, productionPlaces: [String]?, qualification: String?, labelDesc: String?) {
        self.name = name
        self.unFixedName = unFixedName
        self.placeOfBirth = placeOfBirth
        self.dateOfBirth = dateOfBirth
        self.dateOfBirthPrecision = dateOfBirthPrecision
        self.dateOfDeath = dateOfDeath
        self.dateOfDeathPrecision = dateOfDeathPrecision
        self.placeOfDeath = placeOfDeath
        self.occupation = occupation
        self.roles = roles
        self.nationality = nationality
        self.biography = biography
        self.productionPlaces = productionPlaces
        self.qualification = qualification
        self.labelDesc = labelDesc
    }
}
