import Foundation

// This could probably have been done with generics, but it seemed overkill for Advent of Code
struct CharacterMatrix {
    
    enum Errors: Error {
        case notAllRowsAreSameLength
    }
    
    let rowCount: Int
    let columnCount: Int
    private let grid: [[Character]]
    
    init(input: String) throws {
        let lines = input.split(separator: "\n")
        let rows = lines.map({ Array($0) })
        let firstRow = rows.first ?? []
        let allRowsAreSameLength = rows.allSatisfy({ $0.count == firstRow.count })
        
        guard allRowsAreSameLength else {
            throw Errors.notAllRowsAreSameLength
        }
        
        self.rowCount = rows.count
        self.columnCount = firstRow.count
        self.grid = rows
    }
    
    subscript(row: Int, column: Int) -> Character {
        get {
            return grid[row][column]
        }
    }
    
}
