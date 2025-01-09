import Foundation
import RegexBuilder

struct XOfMasFinder {
    
    // E.g.
    // X * S
    // * A *
    // M * S
    // There is almost certainly a more elegant pattern than this. For example, I could implement a function that rotates
    // the context of the matrix. I probably would have done something akin to that if this were a real world problem
    // because requirements eventually change, but this ham-fisted approach seems good enough for this use case.
    private let matrixHeight = 3
    private let matrixWidth = 3
    private let xOfMasPattern = Regex {
        ChoiceOf {
            // Horizontal
            Regex {
                // Row 1
                "M"
                One(.anyNonNewline)
                "S"
                One(.newlineSequence)
                
                // Row 2
                One(.anyNonNewline)
                "A"
                One(.anyNonNewline)
                One(.newlineSequence)
                
                // Row 3
                "M"
                One(.anyNonNewline)
                "S"
            }
            
            // Vertical
            Regex {
                // Row 1
                "M"
                One(.anyNonNewline)
                "M"
                One(.newlineSequence)
                
                // Row 2
                One(.anyNonNewline)
                "A"
                One(.anyNonNewline)
                One(.newlineSequence)
                
                // Row 3
                "S"
                One(.anyNonNewline)
                "S"
            }
        }
        
    }
    
    
    func find(in matrix: CharacterMatrix) -> Int {
        var count = 0
        
        for row in 0...matrix.rowCount-matrixHeight {
            for column in 0...(matrix.columnCount-matrixWidth) {
                let currentCharacters = [
                    matrix[row, column],
                    matrix[row, column+1],
                    matrix[row, column+2],
                    "\n",
                    matrix[row+1, column],
                    matrix[row+1, column+1],
                    matrix[row+1, column+2],
                    "\n",
                    matrix[row+2, column],
                    matrix[row+2, column+1],
                    matrix[row+2, column+2],
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
        return isValid(string) || isValid(string.backwards)
    }
    
    private func isValid(_ string: String) -> Bool {
        return string.matches(of: xOfMasPattern).count == 1
    }
    
}
