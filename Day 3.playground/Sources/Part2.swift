import Foundation

public struct Part2 {
    
    private let multiplierFinder = MultiplierFinder()
    private let multiplesCalculator = MultiplesCalculator()
    
    public init() {}
    
    public func calculateTotalOfEnabledMultiplications(_ input: String) throws -> Int {
        let multipliers = try multiplierFinder.find(in: input)
        let enabledMultipliers = multipliers.filter({ $0.enabled })
        let multiples = multiplesCalculator.calculate(enabledMultipliers)
        return multiples.sum()
    }
    
}
