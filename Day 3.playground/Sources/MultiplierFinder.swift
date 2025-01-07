import Foundation
import RegexBuilder

struct MultiplierFinder {
    
    private let multiplierPattern = Regex {
        "mul("
        Capture {
            OneOrMore(.digit)
        }
        ","
        Capture {
            OneOrMore(.digit)
        }
        ")"
    }    
    
    func find(in input: String) throws -> [Multiplier] {
        let matches = input.matches(of: multiplierPattern)
        var multipliers: [Multiplier] = []
        
        for match in matches {
            let (_, captured1, captured2) = match.output
            let multiplier = try Multiplier(string1: String(captured1), string2: String(captured2))
            multipliers.append(multiplier)
        }
        
        return multipliers
    }
    
}
