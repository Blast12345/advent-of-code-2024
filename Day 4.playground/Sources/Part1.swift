import Foundation

public struct Part1 {
    
    private let xmasFinder = XmasFinder()
    
    public init() {}
    
    public func countOccurencesOfXmas(_ input: String) throws -> Int {
        let matrix = try CharacterMatrix(input: input)
        return xmasFinder.find(in: matrix)
    }
    
}
