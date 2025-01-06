import Foundation

struct ReportParser {
    
    enum Errors: Error {
        case invalidLevel(String)
    }
    
    func parse(_ input: String) throws -> [Report] {
        var output: [Report] = []
        let lines = parseLines(input)
        
        for line in lines {
            let report = try createReport(line)
            output.append(report)
        }
        
        return output
    }
    
    private func parseLines(_ input: String) -> [String] {
        return input.split(separator: "\n").map({ String($0) })
    }
    
    private func createReport(_ line: String) throws -> Report {
        let levels = try parseLevels(line)
        
        return .init(levels: levels)
    }
    
    private func parseLevels(_ line: String) throws -> [Int] {
        let tokens = line.split(separator: " ").map({ String($0) })
        
        return try tokens.map({ try parseLevel($0) })
    }
    
    private func parseLevel(_ token: String) throws -> Int {
        guard let level = Int(token) else {
            throw Errors.invalidLevel(token)
        }
        
        return level
    }
    
}
