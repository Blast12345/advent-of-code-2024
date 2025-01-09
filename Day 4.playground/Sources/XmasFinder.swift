import Foundation

struct XmasFinder {
    
    private let targetString = "XMAS"
    
    func find(in matrix: CharacterMatrix) -> Int {
        let horizontalCount = findHorizontalOcurrences(in: matrix)
        let verticalCount = findVerticalOcurrences(in: matrix)
        let diagonalCount = findDiagonalOcurrences(in: matrix)
        
        return horizontalCount + verticalCount + diagonalCount
    }
    
    private func findHorizontalOcurrences(in matrix: CharacterMatrix) -> Int {
        var count = 0
        
        for row in 0..<matrix.rowCount {
            for column in 0...(matrix.columnCount-targetString.count) {
                let currentCharacters = [
                    matrix[row, column],
                    matrix[row, column+1],
                    matrix[row, column+2],
                    matrix[row, column+3]
                ]
                
                if isValid(currentCharacters) {
                    count += 1
                }
            }
        }
        
        return count
    }
    
    private func findVerticalOcurrences(in matrix: CharacterMatrix) -> Int {
        var count = 0
        
        for column in 0..<matrix.columnCount {
            for row in 0...(matrix.rowCount-targetString.count) {
                let currentCharacters = [
                    matrix[row, column],
                    matrix[row+1, column],
                    matrix[row+2, column],
                    matrix[row+3, column]
                ]
                
                if isValid(currentCharacters) {
                    count += 1
                }
            }
        }
        
        return count
    }
    
    private func findDiagonalOcurrences(in matrix: CharacterMatrix) -> Int {
        var count = 0
        
        // This direction: \
        for row in 0...(matrix.rowCount-targetString.count) {
            for column in 0...(matrix.columnCount-targetString.count) {
                let currentCharacters = [
                    matrix[row, column],
                    matrix[row+1, column+1],
                    matrix[row+2, column+2],
                    matrix[row+3, column+3]
                ]
                
                if isValid(currentCharacters) {
                    count += 1
                }
            }
        }
        
        // This direction: /
        for row in (targetString.count-1)..<matrix.rowCount {
            for column in 0...(matrix.columnCount-targetString.count) {
                let currentCharacters = [
                    matrix[row, column],
                    matrix[row-1, column+1],
                    matrix[row-2, column+2],
                    matrix[row-3, column+3]
                ]
                
                if isValid(currentCharacters) {
                    count += 1
                }
            }
        }
        
        return count
    }
    
    private func isValid(_ characters: [Character]) -> Bool {
        let string = String(characters)
        return isValid(string)
    }
    
    private func isValid(_ string: String) -> Bool {
        return string == targetString || string.backwards == targetString
    }
    
}
