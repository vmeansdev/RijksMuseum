@preconcurrency import AnyCodable

public struct Artwork: Codable, Sendable {
    public let links: Links
    public let id: String
    public let priref: String?
    public let objectNumber: String
    public let language: String?
    public let title: String
    public let copyrightHolder: String?
    public let webImage: Image
    public let colors: [Color]?
    public let colorsWithNormalization: [ColorsWithNormalization]?
    public let normalizedColors: [Color]?
    public let normalized32Colors: [Color]?
    public let materialsThesaurus: [AnyCodable]?
    public let techniquesThesaurus: [AnyCodable]?
    public let productionPlacesThesaurus: [AnyCodable]?
    public let titles: [String]?
    public let description: String?
    public let labelText: String?
    public let objectTypes: [String]?
    public let objectCollection: [String]?
    public let makers: [AnyCodable]?
    public let principalMakers: [PrincipalMaker]?
    public let plaqueDescriptionDutch: String?
    public let plaqueDescriptionEnglish: String?
    public let principalMaker: String?
    public let artistRole: String?
    public let associations: [AnyCodable]?
    public let acquisition: Acquisition?
    public let exhibitions: [AnyCodable]?
    public let materials: [String]?
    public let techniques: [AnyCodable]?
    public let productionPlaces: [String]?
    public let dating: Dating?
    public let classification: Classification?
    public let hasImage: Bool
    public let historicalPersons: [String]?
    public let inscriptions: [AnyCodable]?
    public let documentation: [String]?
    public let catRefRPK: [AnyCodable]?
    public let principalOrFirstMaker: String
    public let dimensions: [Dimension]?
    public let physicalProperties: [AnyCodable]?
    public let physicalMedium: String?
    public let longTitle: String
    public let subTitle: String?
    public let scLabelLine: String?
    public let label: Label?
    public let showImage: Bool
    public let location: String?

    public enum CodingKeys: String, CodingKey {
        case links = "links"
        case id = "id"
        case priref = "priref"
        case objectNumber = "objectNumber"
        case language = "language"
        case title = "title"
        case copyrightHolder = "copyrightHolder"
        case webImage = "webImage"
        case colors = "colors"
        case colorsWithNormalization = "colorsWithNormalization"
        case normalizedColors = "normalizedColors"
        case normalized32Colors = "normalized32Colors"
        case materialsThesaurus = "materialsThesaurus"
        case techniquesThesaurus = "techniquesThesaurus"
        case productionPlacesThesaurus = "productionPlacesThesaurus"
        case titles = "titles"
        case description = "description"
        case labelText = "labelText"
        case objectTypes = "objectTypes"
        case objectCollection = "objectCollection"
        case makers = "makers"
        case principalMakers = "principalMakers"
        case plaqueDescriptionDutch = "plaqueDescriptionDutch"
        case plaqueDescriptionEnglish = "plaqueDescriptionEnglish"
        case principalMaker = "principalMaker"
        case artistRole = "artistRole"
        case associations = "associations"
        case acquisition = "acquisition"
        case exhibitions = "exhibitions"
        case materials = "materials"
        case techniques = "techniques"
        case productionPlaces = "productionPlaces"
        case dating = "dating"
        case classification = "classification"
        case hasImage = "hasImage"
        case historicalPersons = "historicalPersons"
        case inscriptions = "inscriptions"
        case documentation = "documentation"
        case catRefRPK = "catRefRPK"
        case principalOrFirstMaker = "principalOrFirstMaker"
        case dimensions = "dimensions"
        case physicalProperties = "physicalProperties"
        case physicalMedium = "physicalMedium"
        case longTitle = "longTitle"
        case subTitle = "subTitle"
        case scLabelLine = "scLabelLine"
        case label = "label"
        case showImage = "showImage"
        case location = "location"
    }

    public init(links: Links, id: String, priref: String?, objectNumber: String, language: String?, title: String, copyrightHolder: String?, webImage: Image, colors: [Color]?, colorsWithNormalization: [ColorsWithNormalization]?, normalizedColors: [Color]?, normalized32Colors: [Color]?, materialsThesaurus: [AnyCodable]?, techniquesThesaurus: [AnyCodable]?, productionPlacesThesaurus: [AnyCodable]?, titles: [String]?, description: String?, labelText: String?, objectTypes: [String]?, objectCollection: [String]?, makers: [AnyCodable]?, principalMakers: [PrincipalMaker]?, plaqueDescriptionDutch: String?, plaqueDescriptionEnglish: String?, principalMaker: String?, artistRole: String?, associations: [AnyCodable]?, acquisition: Acquisition?, exhibitions: [AnyCodable]?, materials: [String]?, techniques: [AnyCodable]?, productionPlaces: [String]?, dating: Dating?, classification: Classification?, hasImage: Bool, historicalPersons: [String]?, inscriptions: [AnyCodable]?, documentation: [String]?, catRefRPK: [AnyCodable]?, principalOrFirstMaker: String, dimensions: [Dimension]?, physicalProperties: [AnyCodable]?, physicalMedium: String?, longTitle: String, subTitle: String?, scLabelLine: String?, label: Label?, showImage: Bool, location: String?) {
        self.links = links
        self.id = id
        self.priref = priref
        self.objectNumber = objectNumber
        self.language = language
        self.title = title
        self.copyrightHolder = copyrightHolder
        self.webImage = webImage
        self.colors = colors
        self.colorsWithNormalization = colorsWithNormalization
        self.normalizedColors = normalizedColors
        self.normalized32Colors = normalized32Colors
        self.materialsThesaurus = materialsThesaurus
        self.techniquesThesaurus = techniquesThesaurus
        self.productionPlacesThesaurus = productionPlacesThesaurus
        self.titles = titles
        self.description = description
        self.labelText = labelText
        self.objectTypes = objectTypes
        self.objectCollection = objectCollection
        self.makers = makers
        self.principalMakers = principalMakers
        self.plaqueDescriptionDutch = plaqueDescriptionDutch
        self.plaqueDescriptionEnglish = plaqueDescriptionEnglish
        self.principalMaker = principalMaker
        self.artistRole = artistRole
        self.associations = associations
        self.acquisition = acquisition
        self.exhibitions = exhibitions
        self.materials = materials
        self.techniques = techniques
        self.productionPlaces = productionPlaces
        self.dating = dating
        self.classification = classification
        self.hasImage = hasImage
        self.historicalPersons = historicalPersons
        self.inscriptions = inscriptions
        self.documentation = documentation
        self.catRefRPK = catRefRPK
        self.principalOrFirstMaker = principalOrFirstMaker
        self.dimensions = dimensions
        self.physicalProperties = physicalProperties
        self.physicalMedium = physicalMedium
        self.longTitle = longTitle
        self.subTitle = subTitle
        self.scLabelLine = scLabelLine
        self.label = label
        self.showImage = showImage
        self.location = location
    }
}
