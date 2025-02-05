import Foundation

public struct Part1 {
    
    private let multiplierFinder = MultiplierFinder()
    private let multiplesCalculator = MultiplesCalculator()
    
    public init() {}
    
    public func calculateTotalOfMultiplications(_ input: String) throws -> Int {
        let multipliers = try multiplierFinder.find(in: input)
        let multiples = multiplesCalculator.calculate(multipliers)
        return multiples.sum()
    }
    
}
