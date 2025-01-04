import Foundation

public struct ListParser {
    
    public enum Errors: Error {
        case invalidId(String)
        case malformedLine
    }
    
    private typealias Pair = (leftItem: String, rightItem: String)
    
    private let lines: [String]
    
    public init(_ input: String) {
        self.lines = input.split(separator: "\n").map({ String($0) })
    }
    
    public func getLeftList() throws -> [Int] {
        return try getList { $0.leftItem }
    }
    
    public func getRightList() throws -> [Int] {
        return try getList { $0.rightItem }
    }
    
    private func getList(extractItem: (Pair) -> String) throws -> [Int] {
        var list: [Int] = []
        
        for line in lines {
            let pair = try getPair(for: line)
            let item = extractItem(pair)
            
            guard let id = Int(item) else {
                throw Errors.invalidId(item)
            }
            
            list.append(id)
        }
        
        return list
    }
    
    private func getPair(for line: String) throws -> Pair {
        let pair = line.split(separator: "   ").map({ String($0) })
        
        if pair.count == 2 {
            return (pair[0], pair[1])
        } else {
            throw Errors.malformedLine
        }
    }
    
}
