import Foundation

public struct Part1 {
    
    private let multiplierFinder = MultiplierFinder()
    
    public init() {}
    
    public func calculateTotalOfMultiplications(_ input: String) throws -> Int {
        let multipliers = try multiplierFinder.find(in: input)
        let multiples = calculateMultiples(multipliers)
        return multiples.sum()
    }
    
    private func calculateMultiples(_ multipliers: [Multiplier]) -> [Int] {
        var multiples: [Int] = []
        
        for multiplier in multipliers {
            let multiple = calculateMultiple(multiplier)
            multiples.append(multiple)
        }
        
        return multiples
    }
    
    private func calculateMultiple(_ multiplier: Multiplier) -> Int {
        return multiplier.value1 * multiplier.value2
    }
    
}
