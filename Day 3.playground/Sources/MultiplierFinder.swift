import Foundation
import RegexBuilder

struct MultiplierFinder {
    
    enum Errors: Error {
        case missingValue1
        case missingValue2
    }
    
    // Idealy these wouldn't be static, but Swift does not allow top level let variables to use each other.
    private static let pattern = Regex {
        ChoiceOf {
            multiplierPattern
            doCommand
            dontCommand
        }
    }
    
    private static let doCommand = "do()"
    private static let dontCommand = "don't()"
    private static let multiplierPattern = Regex {
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
        let matches = input.matches(of: MultiplierFinder.pattern)
        var multipliers: [Multiplier] = []
        var enabled = true
        
        for match in matches {
            let (wholeString, captured1, captured2) = match.output
            
            if (wholeString == MultiplierFinder.doCommand) {
                enabled = true
                continue
            } else if (wholeString == MultiplierFinder.dontCommand) {
                enabled = false
                continue
            }
            
            guard let captured1 = captured1 else {
                throw Errors.missingValue1
            }
            
            guard let captured2 = captured2 else {
                throw Errors.missingValue2
            }
            
            let multiplier = try Multiplier(string1: String(captured1), string2: String(captured2), enabled: enabled)
            multipliers.append(multiplier)
        }
        
        return multipliers
    }
    
}
