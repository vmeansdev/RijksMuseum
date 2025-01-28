public protocol DialogDestination {
    var title: String? { get }
    var message: String? { get }
    var neutralAction: DialogAction? { get }
}

public struct DialogAction {
    public let title: String
    public let handler: (() -> Void)?

    public init(title: String, handler: (() -> Void)?) {
        self.title = title
        self.handler = handler
    }
}

public struct AlertDialogDestination: DialogDestination {
    public let title: String?
    public let message: String?
    public let neutralAction: DialogAction?

    public init(title: String?, message: String?, neutralAction: DialogAction?) {
        self.title = title
        self.message = message
        self.neutralAction = neutralAction
    }
}
