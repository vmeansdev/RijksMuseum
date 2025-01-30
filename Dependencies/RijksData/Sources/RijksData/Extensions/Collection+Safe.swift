public extension Collection {
    subscript (safe index: Index) -> Self.Iterator.Element? {
        indices.contains(index) ? self[index] : nil
    }
}
