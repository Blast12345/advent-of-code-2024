import Foundation

public struct Part2 {
    
    private let xOfMasFinder = XOfMasFinder()
    
    public init() {}
    
    // Not the most elegant of names.
    public func countOccurencesOfXOfMas(_ input: String) throws -> Int {
        let matrix = try CharacterMatrix(input: input)
        return xOfMasFinder.find(in: matrix)
    }
    
}
