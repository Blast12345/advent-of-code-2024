import Foundation

struct Multiplier {
    let value1: Int
    let value2: Int
}

extension Multiplier {
    
    enum Errors: Error {
        case invalidString1(String)
        case invalidString2(String)
    }
    
    init(string1: String, string2: String) throws {
        guard let value1 = Int(string1) else {
            throw Errors.invalidString1(string1)
        }
        
        guard let value2 = Int(string2) else {
            throw Errors.invalidString2(string2)
        }
        
        self.value1 = value1
        self.value2 = value2
    }
    
}
