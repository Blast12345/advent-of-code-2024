import Foundation

struct MultiplesCalculator {
    
    func calculate(_ multipliers: [Multiplier]) -> [Int] {
        var multiples: [Int] = []
        
        for multiplier in multipliers {
            let multiple = calculate(multiplier)
            multiples.append(multiple)
        }
        
        return multiples
    }
    
    func calculate(_ multiplier: Multiplier) -> Int {
        return multiplier.value1 * multiplier.value2
    }
    
}
